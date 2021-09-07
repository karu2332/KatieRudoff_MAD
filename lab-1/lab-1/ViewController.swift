//
//  ViewController.swift
//  lab-1
//
//  Created by Katie Rudoff on 9/5/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var paragraphText: UILabel!
    
    @IBOutlet weak var sanrioImage: UIImageView!
    
    @IBAction func chooseGudetama(_ sender: UIButton) {
        if sender.tag == 1 {
            sanrioImage.image=UIImage(named: "gudetama")
            paragraphText.text = "Gudetama is a fictional egg yolk."
        }
        else if sender.tag == 2 {
            sanrioImage.image=UIImage(named: "pekkle")
            paragraphText.text = "Pekkle is a fictional small white duck."
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

