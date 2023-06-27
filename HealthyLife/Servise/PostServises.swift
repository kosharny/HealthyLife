//
//  PostServises.swift
//  HealthyLife
//
//  Created by Maksim Kosharny on 07.06.2023.
//

import Firebase
import FirebaseStorage

struct PostServises {
    func fetchNews(comletion: @escaping([PostInfo]) -> Void) {
        Firestore.firestore().collection("post")
            .order(by: "date", descending: true)
            .getDocuments { snapshot, _ in
                guard let document = snapshot?.documents else { return }
                let newNews = document.compactMap({ try? $0.data(as: PostInfo.self) })
                comletion(newNews)
            }
    }
    
    func fetchFilterNews(filterName: String, comletion: @escaping([PostInfo]) -> Void) {
        
        var news = [PostInfo]()
        
        
        Firestore.firestore().collection("post")
            .getDocuments { snapshot, _ in
                guard let document = snapshot?.documents else { return }
                let newNews = document.compactMap({ try? $0.data(as: PostInfo.self) })
                news = newNews.filter({ n in
                    return n.category == filterName
                })
                comletion(news)
                
            }
        
    }
    
    func fetchSavePost(comletion: @escaping([PostInfo]) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        var news = [PostInfo]()
        
        Firestore.firestore().collection("users")
            .document(uid)
            .collection("user-likes")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                
                documents.forEach { doc in
                    let newsID = doc.documentID
                    Firestore.firestore().collection("users")
                        .document(uid)
                        .collection("user-likes")
                        .document(newsID)
                        .getDocument { snapshot, _ in
                            guard let newNews = try? snapshot?.data(as: PostInfo.self) else { return }
                            news.append(newNews)
                            comletion(news)
                        }
                }
            }
    }
    
    
    func savePost(titleName: String, imageName: String, textLabel: String, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let data = ["uid": uid,
                    "titleName": titleName,
                    "imageName": imageName,
                    "textLabel": textLabel] as [String: Any]
        
        Firestore.firestore().collection("users").document(uid).collection("user-likes").document()
            .setData(data) { error in
                if let error = error {
                    print("DEBUG: Failed to upload tweet with: error: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                completion(true)
            }
    }
 

}
