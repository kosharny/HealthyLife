//
//  CalculatorViewModel.swift
//  HealthyLife
//
//  Created by Maksim Kosharny on 14.06.2023.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class CalculatorViewModel: ObservableObject  {
    
    func calorieCalculator(gender: String, weight: Double, height: Double, age: Double, activity: String) {
        var result = 0.0
        
        let sum = (10.0*weight)+(6.25*height)-(5.0*age)
        
        if gender == "Мужской" {
            result = sum + 5.0
        } else if gender == "Женский" {
            result = sum - 161.0
        }
        var calorie = 0.0
        switch activity {
        case "Основной обмен":
            calorie = result*1.2
        case "минимум/отсутсвие физической активности":
            calorie = result*1.3
        case "3 раза в неделю":
            calorie = result*1.375
        case "5 раз в неделю":
            calorie = result*1.55
        case "5 раз в неделю (интенсивно)":
            calorie = result*1.625
        case "Каждый день":
            calorie = result*1.725
        case "Каждый день интенсивно или 2 раза в день":
            calorie = result*1.8
        case "Ежедневная физическая нагрузка+физическая работа":
            calorie = result*1.9
        default:
            calorie = result
        }
        let waterNeeded = Decimal(weight * 0.035)
        let speedResult = Int(calorie * 0.6)
        let lightResult = Int(calorie * 0.8)
        updateValueInFirestoreCollection(newValue: Int(calorie), speedResult: speedResult, lightResult: lightResult, waterNeeded: waterNeeded)
    }
    
    func updateValueInFirestoreCollection(newValue: Int, speedResult: Int, lightResult: Int, waterNeeded: Decimal) {
        
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
                documentRef.updateData(["calorie": newValue]) { error in
                    if let error = error {
                        print("Ошибка при обновлении значения параметра: \(error.localizedDescription)")
                    } else {
                        print("Значение параметра успешно обновлено.")
                    }
                }
                documentRef.updateData(["speedResult": speedResult]) { error in
                    if let error = error {
                        print("Ошибка при обновлении значения параметра: \(error.localizedDescription)")
                    } else {
                        print("Значение параметра успешно обновлено.")
                    }
                }
                documentRef.updateData(["lightResult": lightResult]) { error in
                    if let error = error {
                        print("Ошибка при обновлении значения параметра: \(error.localizedDescription)")
                    } else {
                        print("Значение параметра успешно обновлено.")
                    }
                }
                documentRef.updateData(["waterNeeded": waterNeeded]) { error in
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
    
    func calorieCalculatorView(gender: String, weight: Double, height: Double, age: Double, activity: String) -> Int {
        var result = 0.0
        
        let sum = (10.0*weight)+(6.25*height)-(5.0*age)
        
        if gender == "Мужской" {
            result = sum + 5.0
        } else if gender == "Женский" {
            result = sum - 161.0
        }
        var calorie = 0.0
        switch activity {
        case "Основной обмен":
            calorie = result*1.2
        case "минимум/отсутсвие физической активности":
            calorie = result*1.3
        case "3 раза в неделю":
            calorie = result*1.375
        case "5 раз в неделю":
            calorie = result*1.55
        case "5 раз в неделю (интенсивно)":
            calorie = result*1.625
        case "Каждый день":
            calorie = result*1.725
        case "Каждый день интенсивно или 2 раза в день":
            calorie = result*1.8
        case "Ежедневная физическая нагрузка+физическая работа":
            calorie = result*1.9
        default:
            calorie = result
        }

        
        return Int(calorie)
    }
    
    func resetValueInFirestoreCollection() {
        
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
                documentRef.updateData(["calorie": 0]) { error in
                    if let error = error {
                        print("Ошибка при обновлении значения параметра: \(error.localizedDescription)")
                    } else {
                        print("Значение параметра успешно обновлено.")
                    }
                }
                documentRef.updateData(["speedResult": 0]) { error in
                    if let error = error {
                        print("Ошибка при обновлении значения параметра: \(error.localizedDescription)")
                    } else {
                        print("Значение параметра успешно обновлено.")
                    }
                }
                documentRef.updateData(["lightResult": 0]) { error in
                    if let error = error {
                        print("Ошибка при обновлении значения параметра: \(error.localizedDescription)")
                    } else {
                        print("Значение параметра успешно обновлено.")
                    }
                }
                documentRef.updateData(["waterNeeded": 0]) { error in
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

