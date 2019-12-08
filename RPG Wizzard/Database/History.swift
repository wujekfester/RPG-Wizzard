//
//  NewHistory.swift
//  RPG Wizzard
//
//  Created by Aleksander Bernat on 29.01.2019.
//  Copyright © 2019 Aleksander Bernat. All rights reserved.
//

import Foundation


class History {
    fileprivate var diceList : [Dice] = []
    
    static let sI = History()
    
    func addToHistory(dice: Dice){
        self.diceList.insert(dice, at: 0)
    }
    
    func dicesList() -> [Dice]{
        return diceList
    }
    
    func lastRoll() -> String {
        var tempString: String = ""
        let tempArray: [Int] = diceList[0].gResult()
        for value in tempArray{
                tempString += "\(value) "
            }
            // usuwanie ostatniej spacji w stringu
            tempString.remove(at: tempString.index(before: tempString.endIndex))
            return tempString
        }
    
    func lastRollSum() -> String{
        return diceList[0].gSumResult()
    }
}
    
    
    

