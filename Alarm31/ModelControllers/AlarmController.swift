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
    func addAlarm(fireDate: Date, name: String, enabled: Bool) {
        let alarm = Alarm(fireDate: fireDate, name: name, enabled: enabled)
        alarms.append(alarm)
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
    
    func toggleEnabled(for alarm: Alarm) {
        alarm.enabled = !alarm.enabled
    }
    
    //  MARK: - JSONPersistence
    func fileURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        let filename = "alarmSaved.json"
        let fullURL = documentDirectory.appendingPathComponent(filename)
        return fullURL
    }

    func saveToPersistentStore() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(alarms)
            try data.write(to: fileURL())
        } catch let error {
            print(error)
        }
    }

    func loadFromPersistentStore() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let alarms = try decoder.decode([Alarm].self, from: data)
            self.alarms = alarms
        } catch let error {
            print(error)
        }
    }
}

