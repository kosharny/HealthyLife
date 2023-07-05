//
//  DailyReset.swift
//  HealthyLife
//
//  Created by Maksim Kosharny on 04.07.2023.
//

import SwiftUI
import Firebase
import FirebaseStorage

class DailyReset {
    var drunkWater: Decimal = 0
    var timer: Timer?
    
    init() {
        let calendar = Calendar.current
        let now = Date()
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: calendar.startOfDay(for: now))!
        let midnight = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: tomorrow)!
        let timeInterval = midnight.timeIntervalSinceNow
        waterCount()
        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: false) { [weak self] _ in
            self?.resetVariable()
        }
    }
    
    func resetVariable() {
        drunkWater = 0
        
        let calendar = Calendar.current
        let now = Date()
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: calendar.startOfDay(for: now))!
        let midnight = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: tomorrow)!
        let timeInterval = midnight.timeIntervalSinceNow
        
        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: false) { [weak self] _ in
            self?.resetVariable()
        }
    }
    
    func waterCount() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { (document, error) in
                if let document = document, document.exists {
                    let data = document.data()
                    if let decimalValue = data?["drunkWater"] as? NSNumber {
                        // Доступ к параметру "myParameter"
                        self.drunkWater = NSDecimalNumber(decimal: decimalValue.decimalValue) as Decimal
                        print("Значение параметра: \(decimalValue)")
                    } else {
                        print("Параметр не найден")
                    }
                } else {
                    print("Документ не найден")
                }
            }
    }
}
