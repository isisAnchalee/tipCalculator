//
//  SettingsViewController.swift
//  tips
//
//  Created by Isis Anchalee on 12/27/15.
//  Copyright © 2015 Isis Anchalee. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var firstPercentLabel: UILabel!
    @IBOutlet weak var secondPercentLabel: UILabel!
    @IBOutlet weak var thirdPercentLabel: UILabel!
    @IBOutlet weak var firstSlider: UISlider!
    @IBOutlet weak var secondSlider: UISlider!
    @IBOutlet weak var thirdSlider: UISlider!
    
    @IBAction func changePercent(sender: UISlider) {
        let percent = Int(sender.value * 100)
        firstPercentLabel.text = "\(percent)%"
        savePercentage(percent, key: "first")
    }
    
    @IBAction func changeSecondPercent(sender: UISlider) {
        let percent = Int(sender.value * 100)
        secondPercentLabel.text = "\(percent)%"
        savePercentage(percent, key: "second")
    }
    
    @IBAction func changeThirdPercent(sender: UISlider) {
        let percent = Int(sender.value * 100)
        thirdPercentLabel.text = "\(percent)%"
        savePercentage(percent, key: "third")
    }
    
    @IBAction func SettingsBack(sender: AnyObject) {
      dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        populateDefaultPercents()
        
    }
    
    func savePercentage(percent: Int, key: String) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(percent, forKey: key)
        defaults.synchronize()
    }
    
    func populateDefaultPercents() {
        let percents = ["first", "second", "third"]
        for i in 0...2{
            getPercentValue(percents[i], index: i)
        }
    }
    
    func getPercentValue(key: String, index: Int) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let percent = defaults.integerForKey(key)
        setPercentValue(percent, index: index)
    }
    
    func setPercentValue(percent: Int, index: Int) {
        let UIpercents = [firstPercentLabel, secondPercentLabel, thirdPercentLabel]
        let sliders = [firstSlider, secondSlider, thirdSlider]
        let sliderPercent = Float(Float(percent) / 100.00)
        print(sliderPercent)

        UIpercents[index].text = "\(percent)%"
        sliders[index].setValue(Float(sliderPercent), animated: false)
    }
}
