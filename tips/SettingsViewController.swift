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
        let percent = Int(sender.value * 100)
        firstPercent.text = "\(percent)%"
        savePercentage(percent, key: "first")
    }
    
    @IBAction func changeSecondPercent(sender: UISlider) {
        let percent = Int(sender.value * 100)
        secondPercent.text = "\(percent)%"
        savePercentage(percent, key: "second")
    }
    
    @IBAction func changeThirdPercent(sender: UISlider) {
        let percent = Int(sender.value * 100)
        thirdPercent.text = "\(percent)%"
        savePercentage(percent, key: "third")
    }
    
    @IBAction func SettingsBack(sender: AnyObject) {
      dismissViewControllerAnimated(true, completion: nil)
    }
    
    func savePercentage(percent: Int, key: String) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(percent, forKey: key)
        defaults.synchronize()
    }
}
