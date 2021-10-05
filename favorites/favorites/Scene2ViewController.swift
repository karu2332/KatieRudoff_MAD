//
//  Scene2ViewController.swift
//  favorites
//
//  Created by Katie Rudoff on 9/30/21.
//

import UIKit

class Scene2ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userBook: UITextField!
    @IBOutlet weak var userAuthor: UITextField!
    
    override func viewDidLoad() {
        userBook.delegate = self
        userAuthor.delegate = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // called when user taps the "return" or "done" button on the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // check which segue is running
        if segue.identifier == "doneFavs" {
            // cast as ViewController
            let scene1VC = segue.destination as! ViewController
            // as long as fields aren't emtpy, we can access the data that the user entered
            if userBook.text?.isEmpty == false {
                // set text field to user input
                scene1VC.user.favBook = userBook.text
            }
            if userAuthor.text?.isEmpty == false {
                // set text field to user input
                scene1VC.user.favAuthor = userAuthor.text
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
