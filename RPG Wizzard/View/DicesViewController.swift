//
//  FirstViewController.swift
//  RPG Wizzard
//
//  Created by Aleksander Bernat on 05.12.2018.
//  Copyright © 2018 Aleksander Bernat. All rights reserved.
//

import UIKit

class DicesViewController: UIViewController{
    
    @IBOutlet weak var formatSwitch: UISwitch!
    @IBOutlet weak var dicesCountLabel: UILabel!
    @IBOutlet weak var dicesCountSlider: UISlider!
    @IBOutlet weak var resultLabel: UILabel!
    let diceCreator = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dicesCountSlider.setValue(1.0, animated: false)
        formatSwitch.isEnabled = false
    }

    @IBAction func customDice(_ sender: UIButton) {
        customDiceCreator()
    }
    
    @IBAction func rollDice(_ sender: UIButton){
        let dice = Dice(dSize: sender.tag)
        dice.LetsRollDice(amount: Int(dicesCountSlider.value))
        self.displayResult()
    }
    
    @IBAction func dicesCount(_ sender: UISlider) {
        dicesCountLabel.text = String(Int(dicesCountSlider.value))
    }
    
    @IBAction func valueChanged(_ sender: UISwitch) {
        displayResult()
    }
    
    
    func displayResult(){
        let rH = RollHistory.sharedInstance
        if formatSwitch.isOn{
            resultLabel.text = rH.lastRoll()
        }else{
            resultLabel.text = rH.lastRollSum()
        }
        formatSwitch.isEnabled = true
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
            
            let dice = Dice(dSize: diceSize)
            dice.LetsRollDice(amount: amount)

            self.displayResult()
        }))
        present(alert, animated: true, completion: nil)
    }
}


