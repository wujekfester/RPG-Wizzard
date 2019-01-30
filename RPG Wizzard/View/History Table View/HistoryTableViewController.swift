//
//  HistoryTableViewController.swift
//  RPG Wizzard
//
//  Created by Aleksander Bernat on 18.01.2019.
//  Copyright © 2019 Aleksander Bernat. All rights reserved.
//
import UIKit

class HistoryTableViewController: UITableViewController{
    
    
    //MARK: Properties
    
    @IBOutlet weak var myTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(HistoryTableCellView.self, forCellReuseIdentifier: "cell")


        // Uncomment the following line to preserve selection between presentations
        //self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    // MARK: - Table view data source
    
    override func viewWillAppear(_ animated: Bool) {
        myTableView.reloadData()

    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NewHistory.sI.dicesList().count
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HistoryTableCellView
        let history = NewHistory.sI.dicesList()[indexPath.row]

        let temp: [Int] = history.gResult()
        var stringRolls: String = ""
        for value in temp{
            stringRolls += "\(value) "
        }
        
        // usuwanie ostatniej spacji w stringu
        stringRolls.remove(at: stringRolls.index(before: stringRolls.endIndex))
        cell.rollResultLabel?.text = stringRolls
        cell.diceImage?.image = UIImage(named: history.gImage())
        cell.diceInfoLabel?.text = "\(history.gAmount()) x d\(history.gSides())"

        return cell
    }
}
