//
//  ViewController.swift
//  favorites
//
//  Created by Katie Rudoff on 9/30/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bookLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    // create an instance of Favorite class
    // calling empty initializer, each attribute will have value nil
    var user = Favorite()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindSegue(_ segue:UIStoryboardSegue) {
        bookLabel.text = user.favBook
        authorLabel.text = user.favAuthor
    }
}

