//
//  DailyReset.swift
//  HealthyLife
//
//  Created by Maksim Kosharny on 04.07.2023.
//

import SwiftUI

class DailyReset {
    var drunkWater: Decimal = 0
    var timer: Timer?
    
    init() {
        let calendar = Calendar.current
        let now = Date()
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: calendar.startOfDay(for: now))!
        let midnight = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: tomorrow)!
        let timeInterval = midnight.timeIntervalSinceNow
        
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
}
