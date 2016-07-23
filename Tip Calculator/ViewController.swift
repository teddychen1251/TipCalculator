//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Teddy Chen on 7/19/16.
//  Copyright © 2016 Teddy Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var personsLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var fifteenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var twentyFivePercentButton: UIButton!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var grandTotalLabel: UILabel!
    
    var peopleAmount = 1
    var previousButton = ""
    let buttonDefaultColor = UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1)
    var currentTipAmount : Double = 0.0
    var currentGrandTotalAmount : Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func validateEntry(entry: String) -> Double {
        if let value = Double(entry) {
            return value
        } else {
            return 0
        }
    }
    
    func changePreviousButtonColor(previous: String) {
        switch previous {
        case "tenPercentButton" :
            tenPercentButton.setTitleColor(buttonDefaultColor, forState: UIControlState.Normal)
        case "fifteenPercentButton" :
            fifteenPercentButton.setTitleColor(buttonDefaultColor, forState: UIControlState.Normal)
        case "twentyPercentButton" :
            twentyPercentButton.setTitleColor(buttonDefaultColor, forState: UIControlState.Normal)
        case "twentyFivePercentButton" :
            twentyFivePercentButton.setTitleColor(buttonDefaultColor, forState: UIControlState.Normal)
        default:
            break
        }
    }
    
    func onTappedChanges(button: String, percent: Double) {
        changePreviousButtonColor(previousButton)
        switch button {
        case "tenPercentButton" :
            tenPercentButton.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
            previousButton = button
        case "fifteenPercentButton" :
            fifteenPercentButton.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
            previousButton = button
        case "twentyPercentButton" :
            twentyPercentButton.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
            previousButton = button
        case "twentyFivePercentButton" :
            twentyFivePercentButton.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
            previousButton = button
        default:
            break
        }
        let value = validateEntry(billTextField.text!)
        tipLabel.text = "$" + String(format: "%.2f", value * percent / Double(peopleAmount))
        grandTotalLabel.text = "$" + String(format: "%.2f", (value + value * percent) / Double(peopleAmount))
        currentTipAmount = value * percent
        currentGrandTotalAmount = value + value * percent
        billTextField.endEditing(true)
        
    }
    
    @IBAction func onTappedIncrementPeople(sender: AnyObject) {
        personsLabel.text = String(Int(personsLabel.text!)! + 1)
        peopleAmount += 1
        /*tipLabel.text = String(Double(tipLabel.text!)! / Double(peopleAmount))
        grandTotalLabel.text = String(Double(grandTotalLabel.text!)! / Double(peopleAmount))*/
        /*tipLabel.text = String(format: "%.2f", Double((tipLabel.text?.substringFromIndex(tipLabel.text!.startIndex.advancedBy(1)))!)! / Double(peopleAmount))
        grandTotalLabel.text = String(format: "%.2f", Double((grandTotalLabel.text?.substringFromIndex(grandTotalLabel.text!.startIndex.advancedBy(1)))!)! / Double(peopleAmount))*/
        tipLabel.text = "$" + String(format: "%.2f", currentTipAmount / Double(peopleAmount))
        grandTotalLabel.text = "$" + String(format: "%.2f", currentGrandTotalAmount / Double(peopleAmount))
    }
    
    @IBAction func onTappedDecrementPeople(sender: AnyObject) {
        if Int(personsLabel.text!)! > 1 {
            personsLabel.text = String(Int(personsLabel.text!)! - 1)
            peopleAmount -= 1
            /*tipLabel.text = String(Double(tipLabel.text!)! / Double(peopleAmount))
            grandTotalLabel.text = String(Double(grandTotalLabel.text!)! / Double(peopleAmount))*/
            /*tipLabel.text = String(Double((tipLabel.text?.substringFromIndex(tipLabel.text!.startIndex.advancedBy(1)))!)! / Double(peopleAmount))
            grandTotalLabel.text = String(Double((grandTotalLabel.text?.substringFromIndex(grandTotalLabel.text!.startIndex.advancedBy(1)))!)! / Double(peopleAmount))*/
            tipLabel.text = "$" + String(format: "%.2f", currentTipAmount / Double(peopleAmount))
            grandTotalLabel.text = "$" + String(format: "%.2f", currentGrandTotalAmount / Double(peopleAmount))
        }
    }
    
    @IBAction func onTappedTenPercent(sender: AnyObject) {
                onTappedChanges("tenPercentButton", percent: 0.1)
    }
    @IBAction func onTappedFifteenPercent(sender: AnyObject) {
                onTappedChanges("fifteenPercentButton", percent: 0.15)
    }
    @IBAction func onTappedTwentyPercent(sender: AnyObject) {
               onTappedChanges("twentyPercentButton", percent: 0.2)
    }
    @IBAction func onTappedTwentyFivePercent(sender: AnyObject) {
                onTappedChanges("twentyFivePercentButton", percent: 0.25)

    }
}

