//
//  WaterControlViewModel.swift
//  HealthyLife
//
//  Created by Maksim Kosharny on 04.07.2023.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class WaterControlViewModel: ObservableObject {
    
    func updateValueInFirestoreCollection(drunkWater: Decimal) {
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let db = Firestore.firestore()
        let collectionRef = db.collection("users")
        let documentRef = collectionRef.document(uid)
        
        documentRef.getDocument { (document, error) in
            if let error = error {
                print("Ошибка при получении документа: \(error.localizedDescription)")
                return
            }
            
            guard let document = document, document.exists else {
                print("Документ с идентификатором \(uid) не найден в коллекции users.")
                return
            }
            
            if document.data()?["calorie"] != nil {
                // Здесь предполагается, что параметр существует в документе
                
                // Обновляем значение параметра
                documentRef.updateData(["drunkWater": drunkWater]) { error in
                    if let error = error {
                        print("Ошибка при обновлении значения параметра: \(error.localizedDescription)")
                    } else {
                        print("Значение параметра успешно обновлено.")
                    }
                }
            } else {
                print("Параметр calorie не найден в документе.")
            }
        }
    }
}
