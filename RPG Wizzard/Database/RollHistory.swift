//
//  RollHistory.swift
//  RPG Wizzard
//
//  Created by Aleksander Bernat on 02.01.2019.
//  Copyright © 2019 Aleksander Bernat. All rights reserved.
//

class RollHistory {
    var arrayIndexGlobal: Int = 0
    var rollArray = [[Int]]()
    var rollArrayString = [String]()
    static let sharedInstance = RollHistory()
    /**
     Method that provide result of last dice rolling.
     
     - Returns: Array of Int with merged result of last dice rolling .
     **/
    func lastRoll() -> [Int]{
        return rollArray[0]
    }
    
    func lastRollSum() -> String{
        var sum: Int = 0
        for value in rollArray[0]{
            sum += value
        }
        let sumS:String = String(sum)
        return sumS
    }
    /**
     Method that provide result of last dice rolling.
     
     - Important: All values are separated by a space.
     
     - returns: String with merged result of last dice rolling .
     **/
    func lastRoll() -> String{
        var stringRolls: String = ""
        for value in rollArray[0]{
            stringRolls += "\(value) "
        }
        // usuwanie ostatniej spacji w stringu
        stringRolls.remove(at: stringRolls.index(before: stringRolls.endIndex))
        return stringRolls
    }
}
