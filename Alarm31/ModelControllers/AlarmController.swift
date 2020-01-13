//
//  AlarmController.swift
//  Alarm31
//
//  Created by Jon Corn on 1/13/20.
//  Copyright © 2020 jdcorn. All rights reserved.
//

import Foundation

class AlarmController {
    
    // MARK: - Properties
    static let shared = AlarmController()
    var alarms = [Alarm]()
    
//    var mockAlarms: [Alarm] = {
//        let mockAlarm1 = Alarm(fireDate: Date(), name: "School", enabled: false)
//        let mockAlarm2 = Alarm(fireDate: Date(), name: "Gym", enabled: false)
//        return [mockAlarm1, mockAlarm2]
//    }()
    
    // MARK: - CRUD Functions
    func addAlarm(fireDate: Date, name: String, enabled: Bool) -> Alarm {
        let alarm = Alarm(fireDate: fireDate, name: name, enabled: enabled)
        alarms.append(alarm)
        return alarm
    }
    
    func updateAlarm(alarm: Alarm, fireDate: Date, name: String, enabled: Bool) {
        alarm.fireDate = fireDate
        alarm.name = name
        alarm.enabled = enabled
    }
    
    func deleteAlarm(alarm: Alarm) {
        guard let index = alarms.firstIndex(of: alarm) else { return }
        alarms.remove(at: index)
    }
}
