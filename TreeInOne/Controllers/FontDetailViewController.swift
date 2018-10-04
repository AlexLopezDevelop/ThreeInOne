//
//  FontDetailViewController.swift
//  TreeInOne
//
//  Created by Alex Lopez on 03/10/2018.
//  Copyright © 2018 Cristian Lopez. All rights reserved.
//

import UIKit

class FontDetailViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var fontTitle: UILabel!
    @IBOutlet weak var textPreview: UITextView!
    @IBOutlet weak var pikerFonts: UIPickerView!
    
    var familyName : String = ""
    var fonts : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if fonts.count == 0 {
            self.pikerFonts.isHidden = true
        }
        
        self.fontTitle.text = self.familyName
        self.fontTitle.font = UIFont(name: self.familyName, size: 16.0)
        
        self.textPreview.font = UIFont(name: familyName, size: 14.0)
    }
    
    @IBAction func donePressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    //MARK: - UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.fonts.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fonts[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.textPreview.font = UIFont(name: self.fonts[row], size: 14.0)
    }

}
