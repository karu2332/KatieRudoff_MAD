//
//  ViewController.swift
//  lab-3
//
//  Created by Katie Rudoff on 9/22/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var beatlesImage: UIImageView!
    @IBOutlet weak var imageControl: UISegmentedControl!
    @IBOutlet weak var capitalSwitch: UISwitch!
    @IBOutlet weak var fontSizeLabel: UILabel!
    
    
    func updateImage() {
        if imageControl.selectedSegmentIndex == 0 {
            titleLabel.text = "Bob"
            beatlesImage.image = UIImage(named: "bob")
        } else if imageControl.selectedSegmentIndex == 1 {
            titleLabel.text = "Kevin"
            beatlesImage.image = UIImage(named: "kevin")
        }
    }
    
    func updateFontColor() {
        if imageControl.selectedSegmentIndex == 0 {
            titleLabel.textColor = UIColor.red
        } else if imageControl.selectedSegmentIndex == 1 {
            titleLabel.textColor = UIColor.purple
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
        updateFontColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
