//
//  ViewController.swift
//  lab-4
//
//  Created by Katie Rudoff on 9/30/21.
//

import UIKit

// Adopt the UITextFieldDelegate Protocol
class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var fruitStepper: UIStepper!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var fruitLabel: UILabel!
    @IBOutlet weak var totalDue: UILabel!
    
    // Implement method textFieldShouldReturn
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // dismiss the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func updateTotal() {
        var myPrice : Float // price of fruit
        
        if price.text!.isEmpty {
            myPrice = 0.0
        } else {
            myPrice = Float(price.text!)!
        }
        
        let piecesOfFruit = fruitStepper.value
        let total = myPrice * Float(piecesOfFruit)
        
        if piecesOfFruit > 10 {
            // create a UIAlertController object
            let alert = UIAlertController(title: "Warning", message: "You cannot have more than 10 pieces of fruit", preferredStyle: UIAlertController.Style.alert)
            // create a UIAlertAction object for the button
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
            
            alert.addAction(cancelAction) //adds the alert action to the alert object
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {action in
                self.fruitStepper.value = 10
                self.fruitLabel.text? = "10 Pieces of Fruit"
                self.updateTotal()
            })
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        } // end if statement
        
        // format results as currency
        let currencyFormatter = NumberFormatter()
        //set the number style
        currencyFormatter.numberStyle = NumberFormatter.Style.currency
        // returns a formatted string
        totalDue.text = currencyFormatter.string(from: NSNumber(value: total))
    }
        
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateTotal()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Assign a delegate
        price.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateFruit(_ sender: UIStepper) {
        if fruitStepper.value == 1 {
            fruitLabel.text = "1 Piece of Fruit"
        } else {
            fruitLabel.text = String(format: "%.0f", fruitStepper.value) + " Pieces of Fruit"
        }
        updateTotal()
    }
}


