//
//  SecondViewController.swift
//  TreeInOne
//
//  Created by Alex Lopez on 01/10/2018.
//  Copyright © 2018 Cristian Lopez. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var labelNumber: UILabel!
    @IBOutlet weak var textResult: UITextView!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var labelGoldNumber: UILabel!
    
    var fibonacci : [Int] = [0,1]
    var fibId = 1
    var wantsGoldNum = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateFibId(id: Int(self.stepper.value))
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        self.updateFibId(id: Int(sender.value))
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        self.wantsGoldNum = sender.isOn
        self.calculateGoldNumber()
    }
    
    func generateFibonacciNumbers() {
        self.fibonacci = [0,1]
                    print(fibId)
        for i in 2...fibId {
            self.fibonacci.append(self.fibonacci[i-1]+self.fibonacci[i-2])
        }
        
        let fibStr : [String] = fibonacci.compactMap({ String($0) })
        let reult : String = fibStr.joined(separator: "\n")
        
        textResult.text = reult
    }
    
    func updateFibId(id: Int) {
        self.fibId = id
        self.labelNumber.text = "\(self.fibId)"
        self.generateFibonacciNumbers()
        self.calculateGoldNumber()
    }
    
    func calculateGoldNumber() {
        if self.wantsGoldNum {
            let goldNumber = Double(self.fibonacci[self.fibonacci.count-1]) / Double(self.fibonacci[self.fibonacci.count-2])
            self.labelGoldNumber.text = "\(goldNumber)"
        } else {
            self.labelGoldNumber.text = "View Gold Number"
        }
    }

}

