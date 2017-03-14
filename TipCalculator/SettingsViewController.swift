//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Abhishek Nagpurkar on 3/8/17.
//  Copyright © 2017 Abhishek Nagpurkar. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var pickerView: UIPickerView!
    let defaults = UserDefaults.standard
    
    
    var tipPercentages2 = ["10%", "15%", "20%"]
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.pickerView.dataSource = self;
        self.pickerView.delegate = self;
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tipPercentages2.count;
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return tipPercentages2[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        defaults.set(tipPercentages2[row], forKey: "row")
        defaults.synchronize()
        
    }
    
    
}
