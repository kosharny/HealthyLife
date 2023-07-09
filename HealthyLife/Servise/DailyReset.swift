//
//  DailyReset.swift
//  HealthyLife
//
//  Created by Maksim Kosharny on 04.07.2023.
//

import SwiftUI
import Firebase
import FirebaseStorage

class DailyReset: ObservableObject {
    
    init() {
            scheduleDailyTask()
        }
//    var drunkWater: Decimal = 0
//    var timer: Timer?
//
//    init() {
//        let calendar = Calendar.current
//        let now = Date()
//        let tomorrow = calendar.date(byAdding: .day, value: 1, to: calendar.startOfDay(for: now))!
//        let midnight = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: tomorrow)!
//        let timeInterval = midnight.timeIntervalSinceNow
//        waterCount()
//        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: false) { [weak self] _ in
//            self?.resetVariable()
//        }
//    }
//
//    func resetVariable() {
//        drunkWater = 0
//
//        let calendar = Calendar.current
//        let now = Date()
//        let tomorrow = calendar.date(byAdding: .day, value: 1, to: calendar.startOfDay(for: now))!
//        let midnight = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: tomorrow)!
//        let timeInterval = midnight.timeIntervalSinceNow
//
//        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: false) { [weak self] _ in
//            self?.resetVariable()
//        }
//    }
//
//    func waterCount() {
//        guard let uid = Auth.auth().currentUser?.uid else { return }
//
//        Firestore.firestore().collection("users")
//            .document(uid)
//            .getDocument { (document, error) in
//                if let document = document, document.exists {
//                    let data = document.data()
//                    if let decimalValue = data?["drunkWater"] as? NSNumber {
//                        // Доступ к параметру "myParameter"
//                        self.drunkWater = NSDecimalNumber(decimal: decimalValue.decimalValue) as Decimal
//                        print("Значение параметра: \(decimalValue)")
//                    } else {
//                        print("Параметр не найден")
//                    }
//                } else {
//                    print("Документ не найден")
//                }
//            }
//    }
    
    func updateValue() {
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        let valueRef = db.collection("users").document(uid)
        
        valueRef.updateData(["drunkWater": 0]) { error in
            if let error = error {
                print("Ошибка при обновлении значения параметра: \(error)")
            } else {
                print("Значение параметра обновлено успешно.")
            }
        }
    }
    
    func scheduleDailyTask() {
         let calendar = Calendar.current
         var dateComponents = DateComponents()
         dateComponents.hour = 0
         dateComponents.minute = 0

         let today = Date()
         let nextExecutionDate = calendar.nextDate(after: today, matching: dateComponents, matchingPolicy: .nextTime)!

         let timer = Timer(fireAt: nextExecutionDate, interval: 0, target: self, selector: #selector(runDailyTask), userInfo: nil, repeats: false)
         RunLoop.current.add(timer, forMode: .common)
     }

     // Обработчик таймера, вызывающий функцию обновления значения
     @objc func runDailyTask() {
         updateValue()
     }
}
