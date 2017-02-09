//
//  MemoViewController.swift
//  ぽけメモ2
//
//  Created by マツシタ コウタロウ on 2016/01/28.
//  Copyright © 2016年 マツシタ コウタロウ. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController ,UITextFieldDelegate {
    
    var selectedIndex: Int?
    var titleSingleArray = [String]()
    var contentSingleArray = [String]()
    var titleDoubleArray = [String]()
    var contentDoubleArray = [String]()
    var titleTripleArray = [String]()
    var contentTripleArray = [String]()
    var partytitleSingleArray = [String]()
    var partycontentSingleArray = [String]()
    var partytitleDoubleArray = [String]()
    var partycontentDoubleArray = [String]()
    var partytitleTripleArray = [String]()
    var partycontentTripleArray = [String]()
    var tappedCellIndex: Int = 0
    var saveIndex: Int!
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    let saveData: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if saveIndex == 0 {
        if saveData.arrayForKey("titleSingleArray") != nil {
            titleSingleArray = saveData.arrayForKey("titleSingleArray") as! [String]
            contentSingleArray = saveData.arrayForKey("contentSingleArray") as! [String]
        }
       
        
        if selectedIndex != nil{
            titleTextField.text! = titleSingleArray[selectedIndex!]
            contentTextView.text! = contentSingleArray[selectedIndex!]

        }
            if saveData.arrayForKey("partytitleSingleArray") != nil {
                titleSingleArray = saveData.arrayForKey("partytitleSingleArray") as! [String]
                contentSingleArray = saveData.arrayForKey("partycontentSingleArray") as! [String]
            }
            
            
            if selectedIndex != nil{
                titleTextField.text! = partytitleSingleArray[selectedIndex!]
                contentTextView.text! = partycontentSingleArray[selectedIndex!]
                
            }

        
    }
        if saveIndex == 1 {
            if saveData.arrayForKey("titleDoubleArray") != nil {
                titleDoubleArray = saveData.arrayForKey("titleDoubleArray") as! [String]
                contentDoubleArray = saveData.arrayForKey("contentDoubleArray") as! [String]
            }
            
            
            if selectedIndex != nil{
                titleTextField.text! = titleDoubleArray[selectedIndex!]
                contentTextView.text! = contentDoubleArray[selectedIndex!]
                
            }
            
            if saveData.arrayForKey("partytitleDoubleArray") != nil {
                titleDoubleArray = saveData.arrayForKey("partytitleDoubleArray") as! [String]
                contentDoubleArray = saveData.arrayForKey("partycontentDoubleArray") as! [String]
            }
            
            
            if selectedIndex != nil{
                titleTextField.text! = partytitleDoubleArray[selectedIndex!]
                contentTextView.text! = partycontentDoubleArray[selectedIndex!]
                
            }

            
        }
        if saveIndex == 2 {
            if saveData.arrayForKey("titleTripleArray") != nil {
                titleTripleArray = saveData.arrayForKey("titleTripleArray") as! [String]
                contentTripleArray = saveData.arrayForKey("contentTripleArray") as! [String]
            }
            
            
            if selectedIndex != nil{
                titleTextField.text! = titleTripleArray[selectedIndex!]
                contentTextView.text! = contentTripleArray[selectedIndex!]
                
            }
            
            if saveData.arrayForKey("partytitleTripleArray") != nil {
                titleTripleArray = saveData.arrayForKey("partytitleTripleArray") as! [String]
                contentTripleArray = saveData.arrayForKey("partycontentTripleArray") as! [String]
            }
            
            
            if selectedIndex != nil{
                titleTextField.text! = partytitleTripleArray[selectedIndex!]
                contentTextView.text! = partycontentTripleArray[selectedIndex!]
                
            }

        }
        
        
  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    
    override func viewWillDisappear(animated: Bool) {
        //　別の画面に移る直前の処理
        
       
            if saveIndex == 0 {
                if selectedIndex != nil {
                    titleSingleArray[selectedIndex!] = titleTextField.text!
                    contentSingleArray[selectedIndex!] = contentTextView.text!
                
                if titleTextField.text != ""{
                    saveData.setObject(titleSingleArray, forKey: "titleSingleArray")
                    saveData.setObject(contentSingleArray, forKey: "contentSingleArray")
                    
                }

                }else if selectedIndex == nil {
                //    　　　titleTextFieldの値がnilである時、selectedindexにinsertする
                titleSingleArray.append(titleTextField.text!)
                contentSingleArray.append(contentTextView.text!)
                saveData.setObject(titleSingleArray, forKey: "titleSingleArray")
                saveData.setObject(contentSingleArray, forKey: "contentSingleArray")
    
            }
                if selectedIndex != nil {
                    partytitleSingleArray[selectedIndex!] = titleTextField.text!
                    partycontentSingleArray[selectedIndex!] = contentTextView.text!
                    
                    if titleTextField.text != ""{
                        saveData.setObject(partytitleSingleArray, forKey: "partytitleSingleArray")
                        saveData.setObject(partycontentSingleArray, forKey: "partycontentSingleArray")
                        
                    }
                    
                }else if selectedIndex == nil {
                    //    　　　titleTextFieldの値がnilである時、selectedindexにinsertする
                    partytitleSingleArray.append(titleTextField.text!)
                    partycontentSingleArray.append(contentTextView.text!)
                    saveData.setObject(partytitleSingleArray, forKey: "partytitleSingleArray")
                    saveData.setObject(partycontentSingleArray, forKey: "partycontentSingleArray")
                    
                }

            
            
           
        }
        
        if saveIndex == 1 {
            if selectedIndex != nil {
            titleDoubleArray[selectedIndex!] = titleTextField.text!
            contentDoubleArray[selectedIndex!] = contentTextView.text!
                
            if titleTextField.text != ""{
            saveData.setObject(titleDoubleArray, forKey: "titleDoubleArray")
            saveData.setObject(contentDoubleArray, forKey: "contentDoubleArray")
                    
                }

        }else if selectedIndex == nil {
            //    　　　titleTextFieldの値がnilである時、selectedindexにinsertする
            titleDoubleArray.append(titleTextField.text!)
            contentDoubleArray.append(contentTextView.text!)
            saveData.setObject(titleDoubleArray, forKey: "titleDoubleArray")
            saveData.setObject(contentDoubleArray, forKey: "contentDoubleArray")

        }
            
            if selectedIndex != nil {
                partytitleDoubleArray[selectedIndex!] = titleTextField.text!
                partycontentDoubleArray[selectedIndex!] = contentTextView.text!
                
                if titleTextField.text != ""{
                    saveData.setObject(partytitleDoubleArray, forKey: "partytitleDoubleArray")
                    saveData.setObject(partycontentDoubleArray, forKey: "partycontentDoubleArray")
                    
                }
                
            }else if selectedIndex == nil {
                //    　　　titleTextFieldの値がnilである時、selectedindexにinsertする
                partytitleDoubleArray.append(titleTextField.text!)
                partycontentDoubleArray.append(contentTextView.text!)
                saveData.setObject(partytitleDoubleArray, forKey: "partytitleDoubleArray")
                saveData.setObject(partycontentDoubleArray, forKey: "partycontentDoubleArray")
                
            }

        
            
    }

    if saveIndex == 2 {
        if selectedIndex != nil {
            titleTripleArray[selectedIndex!] = titleTextField.text!
            contentTripleArray[selectedIndex!] = contentTextView.text!
            
            if titleTextField.text != ""{
                saveData.setObject(titleTripleArray, forKey: "titleTripleArray")
                saveData.setObject(contentTripleArray, forKey: "contentTripleArray")
                
            }

            }else if selectedIndex == nil {
            //    　　　titleTextFieldの値がnilである時、selectedindexにinsertする
                titleTripleArray.append(titleTextField.text!)
                contentTripleArray.append(contentTextView.text!)
                saveData.setObject(titleTripleArray, forKey: "titleTripleArray")
                saveData.setObject(contentTripleArray, forKey: "contentTripleArray")

            }
        
        if selectedIndex != nil {
            partytitleTripleArray[selectedIndex!] = titleTextField.text!
            partycontentTripleArray[selectedIndex!] = contentTextView.text!
            
            if titleTextField.text != ""{
                saveData.setObject(partytitleTripleArray, forKey: "partytitleTripleArray")
                saveData.setObject(partycontentTripleArray, forKey: "partycontentTripleArray")
                
            }
            
        }else if selectedIndex == nil {
            //    　　　titleTextFieldの値がnilである時、selectedindexにinsertする
            partytitleTripleArray.append(titleTextField.text!)
            partycontentTripleArray.append(contentTextView.text!)
            saveData.setObject(partytitleTripleArray, forKey: "partytitleTripleArray")
            saveData.setObject(partycontentTripleArray, forKey: "partycontentTripleArray")
            
        }


        }

    
    }


    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
    }

}

    





