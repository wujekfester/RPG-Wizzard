//
//  Dice.swift
//  RPG Wizzard
//
//  Created by Aleksander Bernat on 02.01.2019.
//  Copyright © 2019 Aleksander Bernat. All rights reserved.
//
import UIKit
class Dice {
    fileprivate var dSize: Int
    fileprivate var thisRollResult: [Int] = []

    init(dSize: Int){
        self.dSize = dSize
    }
    
    func LetsRollDice(amount: Int){
        for _ in 0..<amount {
            thisRollResult.insert(Int.random(in: 1...dSize), at: 0)
        }
        self.addToHistory(rollResultArray: thisRollResult)
    }
    
    fileprivate func addToHistory(rollResultArray: [Int]){
        let rollHistory = RollHistory.sharedInstance
        rollHistory.rollArray.insert(rollResultArray, at: 0)
    }
}
