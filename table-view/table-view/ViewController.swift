//
//  ViewController.swift
//  table-view
//
//  Created by Katie Rudoff on 9/25/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var petTable: UITableView!
    
    let listArray = ["Apple", "Peanut Butter", "Banana", "Steak", "Milk"]

    override func viewDidLoad() {
        super.viewDidLoad()
        petTable.dataSource = self
        petTable.delegate = self
        // Do any additional setup after loading the view.
    }
    
    // defines how many rows are needed in the table. The number of rows is defined by the total number of items stored in the listArray
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    
    // runs whenever the table view needs to put data in its rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a cell with a name
        let cell = tableView.dequeueReusableCell(withIdentifier: "groceryItem")
    return cell!
    }
}
