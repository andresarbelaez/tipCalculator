//
//  ViewController.swift
//  tip
//
//  Created by Andrés Arbeláez on 6/14/16.
//  Copyright © 2016 Andrés Arbeláez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setDouble(0.2, forKey: "default_tip_percentage")
        
        defaults.synchronize()
        
        // This is a good place to retrieve the default tip percentage from NSUserDefaults
        // and use it to update the tip amount
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        billField.becomeFirstResponder()

        
        self.tipControl.alpha = 0
        self.tipLabel.alpha = 0
        UIView.animateWithDuration(1.0, animations: {
            self.tipControl.alpha = 1
            self.tipLabel.alpha = 1
        })
        
    }
    
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func calculateTip(sender: AnyObject) {
        let tipPercentages = [0.18, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = tip + bill
        tipLabel.text = String(format:  "$%.2f", tip)
        totalLabel.text = String(format:  "$%.2f", total)
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

