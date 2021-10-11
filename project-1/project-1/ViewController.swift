//
//  ViewController.swift
//  project-1
//
//  Created by Katie Rudoff on 9/25/21.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cells = [TableViewCell]()

    @IBOutlet weak var groceryTable: UITableView!
    
    @IBAction func clearAll(_ sender: UIButton) {
        // zero out the total at the bottom
        TableViewCell.total = 0.0
        let label = sender.superview?.viewWithTag(1) as! UILabel
        label.text = "$0.00"
        // zero out the quantities and stepper values
        for cell in cells {
            cell.myQty = 0
            cell.qty?.text = "Qty: 0"
            cell.cellStepper.value = 0
        }
    }
    
    let listArray = ["Apple", "Bananas", "Milk", "Peanut Butter", "Steak", "Bread"]
    let imageArray = ["icons8-apple-60.png",
                      "icons8-banana-60.png",
                      "icons8-milk-60.png",
                      "icons8-peanut-butter-64.png",
                      "icons8-steak-48.png",
                      "icons8-bread-60.png"
    ]
    let priceArray = [0.40, 0.58, 3.71, 4.96, 10.43, 2.50]
    
    // create an arbitrary constant name for a cell. Identify the cells for storing data in later
    let cellID = "customCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groceryTable.dataSource = self
        groceryTable.delegate = self
        // Do any additional setup after loading the view.
    }
    
    // defines how many rows are needed in the table. The number of rows is defined by the total number of items stores in listArray
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    
    // runs whenever the table view needs to put data in its rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: cellID) as! TableViewCell
        
        // takes in data from the listArray, and based on the cells position in the table view, it stores that data in the text property of the cell's textLabel
        cell.mainText?.text = listArray[indexPath.row]
        cell.myPrice = priceArray[indexPath.row]
        cell.detailText?.text = String(format: "$%.02f", priceArray[indexPath.row])
        cell.imageView?.image = UIImage(named: imageArray [indexPath.row])
        cell.qty?.text = "Qty: \(cell.myQty)"
        // add cell to list
        if !self.cells.contains(cell) {
            self.cells.append(cell)
        }
        return cell
    }
}

