//
//  NewHistoryTableViewController.swift
//  RPG Wizzard
//
//  Created by Aleksander Bernat on 11.02.2019.
//  Copyright © 2019 Aleksander Bernat. All rights reserved.
//

import UIKit

class HistoryTableViewController: UITableViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    var history: [Dice] = []
    override func viewDidAppear(_ animated: Bool) {
        loadData()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.backgroundView = UIImageView(image: UIImage(named: "load10.png"))
        loadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    // MARK: - Table view data source

    func loadData(){
        history = History.sI.dicesList()
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier = "cell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? HistoryTableViewCell else {
            fatalError("cos poszlo nie tak z cell")
        }
        cell.diceImage.image = UIImage(named: history[indexPath.row].gImage())
        cell.diceTypeLabel.text = "\(history[indexPath.row].gAmount()) x d\(history[indexPath.row].gSides())"
        cell.resultLabel.text = "\(history[indexPath.row].gResult())"

        return cell
    }
}
