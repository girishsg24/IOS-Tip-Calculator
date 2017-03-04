//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Girish SG on 3/3/17.
//  Copyright © 2017 Girish SG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var perPersonAmount: UILabel!
    @IBOutlet weak var totalLAbel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var percentageSegment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults=UserDefaults.standard
        let rate1:String = defaults.object(forKey: "rate1") as? String ?? ""
        let rate2:String = defaults.object(forKey: "rate2") as? String ?? ""
        let rate3:String = defaults.object(forKey: "rate3") as? String ?? ""
        
        if (rate1 != "")
        {
            
            self.percentageSegment.setTitle(rate1, forSegmentAt: 0)
        }
        if (rate2 != "")
        {
            self.percentageSegment.setTitle(rate2, forSegmentAt: 1)
        }
        
        if (rate3 != "")
        {
            self.percentageSegment.setTitle(rate3, forSegmentAt: 2)
        }
        calculateTip(animated as AnyObject)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
   
    @IBAction func OnScreenTap(_ sender: Any) {
        view.endEditing(true)
        
    }
    
    
    @IBAction func resetBillAmount(_ sender: Any) {
        self.billTextField.text="$"
    }
    
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let defaults=UserDefaults.standard
        let billAmountString=self.billTextField.text?.replacingOccurrences(of: "$", with: "")
        let billAmount=Double(billAmountString!) ?? 0
        var tipPercentageString=String(self.percentageSegment.titleForSegment(at: self.percentageSegment.selectedSegmentIndex)!) ?? ""
        tipPercentageString=tipPercentageString.replacingOccurrences(of: "%", with: "")
        let tipPercent=Double(tipPercentageString) ?? 0
        let tipAmount:Double=Double(billAmount * tipPercent/100)
        self.tipLabel.text=String(format:"$%.2f",tipAmount)
        self.totalLAbel.text=String(format:"$%.2f",tipAmount+billAmount)
        let pCount:Double=defaults.object(forKey:"pCount") as! Double
        self.perPersonAmount.text=String(format:"$%.2f",(tipAmount+billAmount)/pCount)
    }
    
   
}

