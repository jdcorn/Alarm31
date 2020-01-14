//
//  AlarmDetailTableViewController.swift
//  Alarm31
//
//  Created by Jon Corn on 1/13/20.
//  Copyright © 2020 jdcorn. All rights reserved.
//

import UIKit

class AlarmDetailTableViewController: UITableViewController {
    
    // MARK: - Properties
    var alarmLanding: Alarm? {
        didSet {
            updateViews()
            guard let enabled = alarmLanding?.enabled else {return}
            alarmIsOn = enabled
        }
    }
    var alarmIsOn = true

    // MARK: - Outlets
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var enableButton: UIButton!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func enableButtonTapped(_ sender: Any) {
        guard let alarm = alarmLanding else {return}
        AlarmController.shared.toggleEnabled(for: alarm)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameLabel.text, name != "" else {return}
        if let alarm = alarmLanding {
            let updatedDate = datePicker.date
            AlarmController.shared.updateAlarm(alarm: alarm, fireDate: updatedDate, name: name, enabled: alarmIsOn)
        } else {
            AlarmController.shared.addAlarm(fireDate: datePicker.date, name: name, enabled: alarmIsOn)
        }
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Functions
    func updateViews() {
        loadViewIfNeeded()
        guard let alarm = alarmLanding else {return}
        datePicker.date = alarm.fireDate
        nameLabel.text = alarm.name
        if alarm.enabled {
            enableButton.setTitle("Disable", for: .normal)
            enableButton.backgroundColor = .red
            enableButton.setTitleColor(.white, for: .normal)
        }
    }
}
