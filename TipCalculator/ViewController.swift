//
//  ViewController.swift
//  TipCalculator
//
//  Created by Abhishek Nagpurkar on 3/8/17.
//  Copyright © 2017 Abhishek Nagpurkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var billField: UITextField!
    @IBOutlet var tipLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var tipControl: UISegmentedControl!
    let defaults = UserDefaults.standard
    let tipPercentage = [0.1, 0.15, 0.2]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: Any) {
        
        view.endEditing(true)
        
    }
    
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentage[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "%.2f", tip)
        totalLabel.text = String(format: "%.2f", total)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        
        print("view will appear")
        
        billField.text = ""
        tipLabel.text = "0.0"
        totalLabel.text = "0.0"
        
        
        if let stringValue = defaults.object(forKey: "row")  {
            
            let val = (stringValue as! NSString).doubleValue
            
            let defaultVal = val/100
            
            print("\(defaultVal)")
            
            if let index = tipPercentage.index(of: defaultVal) {
                
                tipControl.selectedSegmentIndex = index
                
            }
            
        } else {
            
            tipControl.selectedSegmentIndex = 0
            
        }
        
        
    }
    
    
    
    
}

