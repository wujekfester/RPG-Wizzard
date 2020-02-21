//
//  Dice.swift
//  RPG Wizzard
//
//  Created by Aleksander Bernat on 02.01.2019.
//  Copyright © 2019 Aleksander Bernat. All rights reserved.
//
import UIKit
class Dice {
    fileprivate var sides: Int
    fileprivate var amount: Int
    fileprivate var result: [Int] = []
    fileprivate var sumResult: Int = 0
    fileprivate var dImage: String

    init(sides: Int, amount: Int, imageTag: Int...){
        self.sides = sides
        self.amount = amount
        if imageTag.contains(101) {
            self.dImage = "d101"
        } else {
            self.dImage = "d\(sides)"
        }
    }
    
    func RollDice(){
        for _ in 0..<self.amount {
            result.insert(Int.random(in: 1...self.sides), at: 0)
            sumResult += result[0]
        }
    }
    
    func gSides() -> Int {
        return self.sides
    }
    
    func gAmount() -> Int {
        return self.amount
    }
    
    func gResult() -> [Int]{
        return self.result
    }
    
    func gImage() -> String{
        return self.dImage
    }
    
    func gResult() -> String{
        var resultString: String = ""
        for result in result{
            resultString += "\(result) "
        }
        // usuwanie ostatniej spacji w stringu
        resultString.removeLast()
        return resultString
    }
    
    func gSumResult() -> String{
        return String(self.sumResult)
    }
}
