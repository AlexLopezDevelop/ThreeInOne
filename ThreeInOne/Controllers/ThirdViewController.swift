//
//  ThirdViewController.swift
//  TreeInOne
//
//  Created by Alex Lopez on 01/10/2018.
//  Copyright © 2018 Cristian Lopez. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var familiesFont: [String] = []
    var fonts: [String: [String]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.familiesFont = UIFont.familyNames
        self.familiesFont = self.familiesFont.sorted(by: { return $0 < $1 })
        for f in familiesFont {
            self.fonts[f] = UIFont.fontNames(forFamilyName: f)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowFontsByFamily" {
            let navController = segue.destination as! UINavigationController
            let destinationVC = navController.topViewController as! FontDetailViewController
            let idx = self.tableView.indexPathForSelectedRow!.row
            destinationVC.familyName = self.familiesFont[idx]
            destinationVC.fonts = self.fonts[self.familiesFont[idx]]!
        }
    }
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.familiesFont.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FontFamilyCell", for  : indexPath)
        let fontFamily = self.familiesFont[indexPath.row]
        cell.textLabel?.text = fontFamily
        cell.textLabel?.font = UIFont(name: fontFamily, size: 20.0)
        return cell
    }

    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let familyFont = self.fonts[self.familiesFont[indexPath.row]]!
        
    }
}
