//
//  HistoryTableViewController.swift
//  RPG Wizzard
//
//  Created by Aleksander Bernat on 18.01.2019.
//  Copyright © 2019 Aleksander Bernat. All rights reserved.
//
import Foundation
import UIKit

class HistoryTableViewController: UITableViewController{
    
    
    //MARK: Properties
    
    @IBOutlet weak var myTableView: UITableView!
    //var rH = RollHistory.sharedInstance.rollArray

    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.reloadData()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(HistoryTableCellView.self, forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

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
        return RollHistory.sharedInstance.rollArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HistoryTableCellView
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HistoryTableCellView
        
        
        let temp: [Int] = RollHistory.sharedInstance.rollArray[indexPath.row]
        var stringRolls: String = ""
        for value in temp{
            stringRolls += "\(value) "
        }
        // usuwanie ostatniej spacji w stringu
        stringRolls.remove(at: stringRolls.index(before: stringRolls.endIndex))
      //  cell.textLabel?.text = stringRolls
        cell.rollResultLabel?.text = stringRolls




        return cell
    }

//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return rH.count
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "HistoryTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? HistoryTableCellView else {
            fatalError("The dequeued cell is not an instance of HistoryTableViewCell")
        }
        let history = rH[indexPath.row]
        print(history)
        var tempString: String = ""
        for value in history{
            tempString += "\(value) "
        }
        cell.rollResultLabel.text = tempString
        // Configure the cell...

        return cell
    }*/
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
