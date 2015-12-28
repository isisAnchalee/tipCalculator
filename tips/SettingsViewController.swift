//
//  SettingsViewController.swift
//  tips
//
//  Created by Isis Anchalee on 12/27/15.
//  Copyright © 2015 Isis Anchalee. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var firstPercent: UILabel!
    @IBOutlet weak var secondPercent: UILabel!
    @IBOutlet weak var thirdPercent: UILabel!
    
    @IBAction func changePercent(sender: UISlider) {
        firstPercent.text = "\(Int(sender.value * 100))%"
    }
    
    @IBAction func changeSecondPercent(sender: UISlider) {
        secondPercent.text = "\(Int(sender.value * 100))%"
    }
    
    @IBAction func changeThirdPercent(sender: UISlider) {
        thirdPercent.text = "\(Int(sender.value * 100))%"
    }
    
    @IBAction func SettingsBack(sender: AnyObject) {
      dismissViewControllerAnimated(true, completion: nil)
    }
}
