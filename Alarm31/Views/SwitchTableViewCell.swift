//
//  SwitchTableViewCell.swift
//  Alarm31
//
//  Created by Jon Corn on 1/13/20.
//  Copyright © 2020 jdcorn. All rights reserved.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {

    // Outlets
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var alarmSwitch: UISwitch!
    
    // Actions
    @IBAction func switchValueChanged(_ sender: Any) {
    }
}
