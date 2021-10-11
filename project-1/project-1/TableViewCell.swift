//
//  TableViewCell.swift
//  project-1
//
//  Created by Katie Rudoff on 9/26/21.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var myQty: Int = 0
    var myPrice: Double = 0.0
    static var total: Double = 0.0

    @IBOutlet weak var mainText: UILabel!
    @IBOutlet weak var detailText: UILabel!
    @IBOutlet weak var qty: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellStepper: UIStepper!
    @IBOutlet weak var totalPrice: UILabel!
    
    @IBAction func qtyStepper(_ sender: UIStepper) {
        let val = Int(sender.value)
        if val > self.myQty {
            // value increased
            TableViewCell.total += self.myPrice
        } else {
            // value decreased
            TableViewCell.total -= self.myPrice

        }
        // due to rounding, total can go slightly negative
        if TableViewCell.total < 0.0 {
            TableViewCell.total = 0.0
        }
        self.myQty = val
        self.qty.text = "Qty: \(self.myQty)"
        self.totalPrice.text = String(format: "$%.02f", TableViewCell.total)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
