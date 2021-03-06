//
//  ViewController.swift
//  tips
//
//  Created by Isis Anchalee on 12/25/15.
//  Copyright © 2015 Isis Anchalee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSegment: UISegmentedControl!
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var twoPeople: UILabel!
    @IBOutlet weak var threePeople: UILabel!
    @IBOutlet weak var fourPeople: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        populateDefaultPercents()
        
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        populateDefaultPercents()
        let tipPercentages = populatePercentArray()
        let tipPercentage = Double(tipPercentages[tipSegment.selectedSegmentIndex])
        let amount = NSString(string: billField.text!).doubleValue
        let tip = amount * tipPercentage
        let total = amount + tip
        
        tipLabel.text = String(format:"$%.2f", tip)
        totalLabel.text = String(format:"$%.2f", total)
        populateDividedAmounts(total)
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func divideBill(total: Double, people: Double) {
        let parties = [twoPeople, threePeople, fourPeople]
        let billAmount = total / people
        parties[Int(people) - 2].text = String(format:"$%.2f", billAmount)
    }
    
    func populateDividedAmounts(amount: Double){
        for party in 2...4{
            divideBill(amount, people: Double(party))
        }
    }
    
    func populatePercentArray() -> [Float]  {
        let defaults = NSUserDefaults.standardUserDefaults()
        let percents = ["first", "second", "third"]
        var values  = [Float]()
        
        for i in 0...2{
            values.append(Float(Float(defaults.integerForKey(percents[i]))/100))
        }
        
        print(values)
        return values
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
        setSegmentPercentValue(key, percent: percent, index: index)
    }
    
    func setSegmentPercentValue(key: String, percent: Int, index: Int) {
        tipSegment.setTitle("\(percent)%", forSegmentAtIndex: index)
    }
    
}

