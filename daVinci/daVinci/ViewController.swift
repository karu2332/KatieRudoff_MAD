//
//  ViewController.swift
//  daVinci
//
//  Created by Katie Rudoff on 8/31/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var artImage: UIImageView!
    
    @IBAction func chooseArt(_ sender: UIButton) {
        if sender.tag == 1 {
            artImage.image = UIImage(named: "monaLisa")
        }
        else if sender.tag == 2 {
            artImage.image = UIImage(named: "vitruvian")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

