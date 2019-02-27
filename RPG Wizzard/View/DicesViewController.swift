//
//  FirstViewController.swift
//  RPG Wizzard
//
//  Created by Aleksander Bernat on 05.12.2018.
//  Copyright © 2018 Aleksander Bernat. All rights reserved.
//

import UIKit

class DicesViewController: UIViewController{
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBOutlet weak var dicesCountLabel: UILabel!
    @IBOutlet weak var dicesCountSlider: UISlider!
    @IBOutlet weak var resultLabel: UILabel!
    let diceCreator = UIView()
    var displayMode: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepTapGesture()
        dicesCountSlider.setValue(1.0, animated: false)
    }

    @IBAction func customDice(_ sender: UIButton) {
        customDiceCreator()
    }
    
    @IBAction func rollDice(_ sender: UIButton){
        let dice = Dice(sides: sender.tag, amount: Int(dicesCountSlider.value))
        dice.RollDice()
        History.sI.addToHistory(dice: dice)
        self.displayResult()
    }
    
    @IBAction func dicesCount(_ sender: UISlider) {
        dicesCountLabel.text = String(Int(dicesCountSlider.value))
    }
    
    
    
    func displayResult(){
        let rollHistory = History.sI
        if (displayMode == true){
            resultLabel.text = rollHistory.lastRoll()
        }else{
            resultLabel.text = rollHistory.lastRollSum()
        }
    }
    
    func customDiceCreator(){
        let alert = UIAlertController(title: "Własna kość", message: "Podaj ilczbę ścianek i ilość kości. Jeśli nie podasz wartości, kości nie zostaną rzucone.", preferredStyle: UIAlertController.Style.alert)
        
        alert.addTextField { (diceSidesTextField: UITextField!) in
            diceSidesTextField.placeholder = "Ilość ścianek"
            diceSidesTextField.keyboardType = .numberPad
        }
        alert.addTextField { (diceAmountTextField: UITextField!) in
            diceAmountTextField.placeholder = "Ilość kości"
            diceAmountTextField.keyboardType = .numberPad
        }
        alert.addAction(UIAlertAction.init(title: "OK", style: .default, handler: { (UIAlertAction) in
            let listOfTextFields = alert.textFields!
            guard let diceSize: Int = Int((listOfTextFields.first!.text!)) else {
                return
            }
            guard let amount: Int = Int((listOfTextFields.last!.text!)) else {
                return
            }
            
            let dice = Dice(sides: diceSize, amount: amount)
            dice.RollDice()
            History.sI.addToHistory(dice: dice)
            self.displayResult()
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func prepTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(DicesViewController.tapFunction(sender:)))
        tapGesture.numberOfTapsRequired = 1
        resultLabel.addGestureRecognizer(tapGesture)
        resultLabel.isUserInteractionEnabled = true
    }
    
    @objc func tapFunction(sender: UITapGestureRecognizer){
        displayMode.toggle()
        displayResult()
    }
}


