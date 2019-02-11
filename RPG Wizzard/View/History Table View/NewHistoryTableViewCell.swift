//
//  NewHistoryTableViewCell.swift
//  RPG Wizzard
//
//  Created by Aleksander Bernat on 11.02.2019.
//  Copyright © 2019 Aleksander Bernat. All rights reserved.
//

import UIKit

class NewHistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var diceImage: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var diceTypeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
