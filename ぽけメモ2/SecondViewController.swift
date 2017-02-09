//
//  SecondViewController.swift
//  ぽけメモ2
//
//  Created by マツシタ コウタロウ on 2015/12/03.
//  Copyright © 2015年 マツシタ コウタロウ. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var thirdTextField: UITextField!
    @IBOutlet weak var fourthTextField: UITextField!
    @IBOutlet weak var fifthTextField: UITextField!
    @IBOutlet weak var sixthTextField: UITextField!
    
    var firstArray = [String]()
    var secondArray = [String]()
    var thirdArray = [String]()
    var fourthArray = [String]()
    var fifthArray = [String]()
    var sixthArray = [String]()
    var iconload = IconLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstTextField.delegate = self
        secondTextField.delegate = self
        thirdTextField.delegate = self
        fourthTextField.delegate = self
        fifthTextField.delegate = self
        sixthTextField.delegate = self
        iconload.loadcsv()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if  segue.identifier == "SecondView" {
            let SecondViewController = segue.destinationViewController as! ForecastViewController
            
            SecondViewController.sendText
                .append(self.firstTextField.text!)
            SecondViewController.sendText.append(self.secondTextField.text!)
            SecondViewController.sendText.append(self.thirdTextField.text!)
            SecondViewController.sendText.append(self.fourthTextField.text!)
            SecondViewController.sendText.append(self.fifthTextField.text!)
            SecondViewController.sendText.append(self.sixthTextField.text!)
        }
    }
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

