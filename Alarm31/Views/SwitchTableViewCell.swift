//
//  SwitchTableViewCell.swift
//  Alarm31
//
//  Created by Jon Corn on 1/13/20.
//  Copyright © 2020 jdcorn. All rights reserved.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {
    
    // Properties
    var alarm: Alarm? {
        didSet {
            updateViews()
        }
    }

    // Outlets
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var alarmSwitch: UISwitch!
    
    // Actions
    @IBAction func switchValueChanged(_ sender: Any) {
    }
    
    // Functions
    func updateViews() {
        if let alarm = alarm {
            timeLabel.text = alarm.fireTimeAsString
            nameLabel.text = alarm.name
            alarmSwitch.isOn.toggle()
        }
    }
}
