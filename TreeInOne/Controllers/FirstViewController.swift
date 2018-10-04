//
//  FirstViewController.swift
//  TreeInOne
//
//  Created by Alex Lopez on 01/10/2018.
//  Copyright © 2018 Cristian Lopez. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var labelAge: UILabel!
    @IBOutlet weak var sliderAge: UISlider!
    
    var userAge = -1
    var userName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateAgeLabel()
    }
    
    @IBAction func sliderAgeMoved(_ sender: UISlider) {
        self.updateAgeLabel()
    }
    
    @IBAction func validateDataPressed(_ sender: UIButton) {
        
        let shouldEnter = (userName == "Alex Lopez") || (userAge>=18)
        
        if shouldEnter {
            print("Party access & Free food")
            self.view.backgroundColor = UIColor(displayP3Red: 49.0/255.0, green: 237.0/255.0, blue: 93.0/255.0, alpha: 0.7)
        } else {
            print("Acces denied")
            self.view.backgroundColor = UIColor(displayP3Red: 250.0/255.0, green: 50.0/255.0, blue: 50.0/255.0, alpha: 0.7)
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        if let TheText = textField.text {
            userName = TheText
        }
        
        return true
    }
    
    
    //Custom functions
    func updateAgeLabel() {
        self.userAge = Int(self.sliderAge.value)
        self.labelAge.text = "\(self.userAge)"
    }

}

