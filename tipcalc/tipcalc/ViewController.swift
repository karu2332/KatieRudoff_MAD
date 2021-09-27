//
//  ViewController.swift
//  tipcalc
//
//  Created by Katie Rudoff on 9/23/21.
//

import UIKit
// Step (1) class ViewController is adopting the protocol UITextFieldDelegate
class ViewController: UIViewController, UITextFieldDelegate {
    
    // Step (2) implement method textFieldShouldReturn
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // dismiss the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func updateTipTotals() {
        var amount:Float // check amount
        var pct:Float // tip percentage
        
        if checkAmount.text!.isEmpty {
            amount = 0.0
        } else {
            amount = Float(checkAmount.text!)!
        }
        if tipPercent.text!.isEmpty {
            pct = 0.0
        } else {
            pct = Float(tipPercent.text!)!/100
        }
        
        let numberOfPeople = peopleStepper.value
        let tip = amount * pct
        let total = amount + tip
        var personTotal : Float = 0.0 // specify Float so it's not a Double
        if numberOfPeople > 0 {
            personTotal = total / Float(numberOfPeople)
        } else {
            // create a UIAlertController object
            let alert = UIAlertController(title: "Warning", message: "The number of people must be greater than 0", preferredStyle: UIAlertController.Style.alert)
            // create a UIAlertAction object for the button
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(cancelAction) // adds the alert action to the alert object
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {action in
                self.peopleStepper.value = 1
                self.peopleLabel.text? = "1 person"
                self.updateTipTotals()
            })
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        } // end else
        // format results as currency
        let currencyFormatter = NumberFormatter()
        // set the numbe style
        currencyFormatter.numberStyle = NumberFormatter.Style.currency
        // returns a formatted string
        tipDue.text = currencyFormatter.string(from: NSNumber(value: tip))
        totalDue.text = currencyFormatter.string(from: NSNumber(value: total))
        totalDuePerPerson.text = currencyFormatter.string(from: NSNumber(value: personTotal))
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
            updateTipTotals()
        }
    
    override func viewDidLoad() {
        // Step (3) assign a delegate
        checkAmount.delegate = self
        tipPercent.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var checkAmount: UITextField!
    @IBOutlet weak var tipPercent: UITextField!
    
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var peopleStepper: UIStepper!
    
    @IBOutlet weak var tipDue: UILabel!
    @IBOutlet weak var totalDue: UILabel!
    @IBOutlet weak var totalDuePerPerson: UILabel!
    
    @IBAction func updatePeople(_ sender: UIStepper) {
        if peopleStepper.value == 1 {
            peopleLabel.text = "1 person"
        } else {
            peopleLabel.text = String(format: "%.0f", peopleStepper.value) + " people"
        }
        updateTipTotals()
    }
}
