//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Girish SG on 3/3/17.
//  Copyright © 2017 Girish SG. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var rate3Switch: UISwitch!
    @IBOutlet weak var rate2Switch: UISwitch!
    @IBOutlet weak var rate3TextField: UITextField!
    @IBOutlet weak var rate2TextField: UITextField!
    @IBOutlet weak var rate1TextField: UITextField!
    @IBOutlet weak var rate1Switch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onScreenTouch(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func rate1SwitchCahnged(_ sender: Any) {
        
        if(rate1Switch.isOn)
        {
            rate1TextField.isUserInteractionEnabled=true
            self.rate1TextField.backgroundColor=UIColor.white
        }
        else
        {
            let defaults=UserDefaults.standard
            var rate1Text:String=rate1TextField.text!
            rate1Text=rate1Text.replacingOccurrences(of:"%", with: "")
            defaults.set(rate1Text+"%", forKey: "rate1")
            defaults.synchronize()
            rate1TextField.isUserInteractionEnabled=false
            self.rate1TextField.backgroundColor=UIColor.lightGray
        }
    }
    
    
    @IBAction func rate2SwitchChanged(_ sender: Any) {
        
        if(rate2Switch.isOn)
        {
            self.rate2TextField.isUserInteractionEnabled=true
            self.rate2TextField.backgroundColor=UIColor.white
        }
        else
        {
            let defaults=UserDefaults.standard
            var rate2Text:String=rate2TextField.text!
            rate2Text=rate2Text.replacingOccurrences(of:"%", with: "")
            defaults.set(rate2Text+"%", forKey: "rate2")
            defaults.synchronize()
            self.rate2TextField.isUserInteractionEnabled=false
            self.rate2TextField.backgroundColor=UIColor.lightGray
            
        }
        
        
    }
    
    @IBOutlet weak var peopleCountTextField: UITextField!
    @IBOutlet weak var peopleStepper: UIStepper!
    
    @IBAction func StepperChanged(_ sender: Any) {
        var num:Double=self.peopleStepper.value
       if(num == 0.0){
            self.peopleStepper.value = 1.0
            num = 1.0
        }
       
        self.peopleCountTextField.text=String(Int(num))
    }
    @IBAction func rate3SwitchChanged(_ sender: Any) {
        
        if(rate3Switch.isOn)
        {
            self.rate3TextField.isUserInteractionEnabled=true
            self.rate3TextField.backgroundColor=UIColor.white
        }
        else
        {
            let defaults=UserDefaults.standard
            var rate3Text:String=rate3TextField.text!
            rate3Text=rate3Text.replacingOccurrences(of:"%", with: "")
            defaults.set(rate3Text+"%", forKey: "rate3")
            defaults.synchronize()
            self.rate3TextField.isUserInteractionEnabled=false
            self.rate3TextField.backgroundColor=UIColor.lightGray
        }
        
    }
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        let defaults=UserDefaults.standard
        let rate1:String = defaults.object(forKey: "rate1") as? String ?? ""
        let rate2:String = defaults.object(forKey: "rate2") as? String ?? ""
        let rate3:String = defaults.object(forKey: "rate3") as? String ?? ""
        let pCount:Double=defaults.object(forKey: "pCount") as? Double ?? 1.0
        if (rate1 != "")
        {
            self.rate1TextField.text=rate1
        }
        if (rate2 != "")
        {
            self.rate2TextField.text=rate2
        }
        self.peopleStepper.value=pCount
        self.peopleCountTextField.text=String(Int(pCount))
        self.peopleCountTextField.text=String(Int(pCount))
        if (rate3 != "")
        {
            self.rate3TextField.text=rate3
        }
        self.rate1TextField.isUserInteractionEnabled=false
        self.rate2TextField.isUserInteractionEnabled=false
        self.rate3TextField.isUserInteractionEnabled=false
        self.rate1TextField.backgroundColor=UIColor.lightGray
        self.rate2TextField.backgroundColor=UIColor.lightGray
        self.rate3TextField.backgroundColor=UIColor.lightGray
        self.rate1Switch.setOn(false,animated:animated)
        self.rate2Switch.setOn(false,animated: animated)
        self.rate3Switch.setOn(false, animated: animated)
        
        
        
    }

   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let defaults=UserDefaults.standard
        defaults.set((Double(self.peopleCountTextField.text!)), forKey:"pCount")
    }

}
