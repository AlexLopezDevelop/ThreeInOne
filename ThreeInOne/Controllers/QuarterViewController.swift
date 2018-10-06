//
//  QuarterViewController.swift
//  TreeInOne
//
//  Created by Alex Lopez on 04/10/2018.
//  Copyright © 2018 Cristian Lopez. All rights reserved.
//

import UIKit

class QuarterViewController: UIViewController {

    @IBOutlet weak var imageStatus: UIImageView!
    @IBOutlet weak var labelStatus: UILabel!
    @IBOutlet weak var massSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    var userMass = 0
    var userHeight = 0
    var userHeightPow = 0.0
    var userIMC = 0.0
    var conversion = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateValuesSlider()
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        conversion = Double(userHeight/100)
        userHeightPow = pow(conversion,2)
        userIMC = Double(userMass)/userHeightPow
        
        if (userIMC < 18.5) {
            labelStatus.text = "Less than normal weight"
            imageStatus.image = UIImage(named: "bad")
        } else if (userIMC >= 18.5 && userIMC < 25) {
            labelStatus.text = "Normal"
            imageStatus.image = UIImage(named: "good")
        } else if (userIMC >= 25 && userIMC < 30) {
            labelStatus.text = "Weight higher than normal"
            imageStatus.image = UIImage(named: "bad")
        } else if (userIMC >= 30) {
            labelStatus.text = "Obesity"
            imageStatus.image = UIImage(named: "bad")
        } else {
            labelStatus.text = "Please check your data"
            imageStatus.image = UIImage(named: "none")
        }
    }
    
    @IBAction func massMoved(_ sender: Any) {
        updateValuesSlider()
    }
    
    @IBAction func heightMoved(_ sender: Any) {
        updateValuesSlider()
    }
    
    //MARK: - Custom functions
    func updateValuesSlider() {
        userMass = Int(massSlider.value)
        userHeight = Int(heightSlider.value)
        self.massLabel.text = "\(userMass)Kg"
        self.heightLabel.text = "\(userHeight)cm"
    }
    
}
