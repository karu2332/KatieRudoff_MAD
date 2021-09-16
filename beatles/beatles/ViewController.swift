//
//  ViewController.swift
//  beatles
//
//  Created by Katie Rudoff on 9/9/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var beatlesImage: UIImageView!
    @IBOutlet weak var fontSizeLabel: UILabel!
    @IBOutlet weak var imageControl: UISegmentedControl!
    
    func updateImage() {
        if imageControl.selectedSegmentIndex == 0 {
            titleLabel.text = "Young Beatles"
            beatlesImage.image = UIImage(named: "beatles1")
        } else if imageControl.selectedSegmentIndex == 1 {
            titleLabel.text = "Not so young Beatles"
            beatlesImage.image = UIImage(named: "beatles2")
        }
    }
    
    func updateCaps() {
        if capitalSwitch.isOn {
            // capital
            titleLabel.text = titleLabel.text?.uppercased()
        } else {
            titleLabel.text = titleLabel.text?.lowercased()
        }
    }

    @IBAction func changeFontSize(_ sender: UISlider) {
        let fontSize = sender.value
        fontSizeLabel.text = String(format: "%.0f", fontSize)
        let fontSizeCGFloat = CGFloat(fontSize)
        titleLabel.font = UIFont.systemFont(ofSize: fontSizeCGFloat)
    }
    
    @IBAction func updateFont(_ sender: UISwitch) {
        updateCaps()
    }
    
    @IBAction func changeInfo(_ sender: UISegmentedControl) {
        updateImage()
        updateCaps()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

