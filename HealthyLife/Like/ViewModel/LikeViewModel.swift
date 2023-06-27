//
//  LikeViewModel.swift
//  HealthyLife
//
//  Created by Maksim Kosharny on 09.06.2023.
//

import Foundation

class LikeViewModel: ObservableObject {
    @Published var posts = [PostInfo]()
//    @Published var post: PostInfo
    let servise = PostServises()
    
    init() {
//        self.post = post
        fetchPostSave()
    }
    
    func fetchPostSave() {
        servise.fetchSavePost { post in
            self.posts = post
        }
    }
    
//    func savePost(ad: PostInfo) {
//        servise.savePost(titleName: ad.titleName, imageName: ad.imageName, textLabel: ad.textLabel ?? "") { success in
//            if success {
//                self.post.isSave = true
//            }
//        }
//    }
}
