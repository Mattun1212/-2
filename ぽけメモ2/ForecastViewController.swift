//
//  ForecastViewController.swift
//  ぽけメモ2
//
//  Created by マツシタ コウタロウ on 2016/06/23.
//  Copyright © 2016年 マツシタ コウタロウ. All rights reserved.
//

import UIKit

class ForecastViewController: UIViewController {
    
    @IBOutlet var firstbutton: UIButton!
    @IBOutlet var secondbutton: UIButton!
    @IBOutlet var thirdbutton: UIButton!
    @IBOutlet var fourthbutton: UIButton!
    @IBOutlet var fifthbutton: UIButton!
    @IBOutlet var sixthbutton: UIButton!
    
    var sendText:[String] = [String]()
    
    var iconload = IconLoad()
    var loadText = [[String]]()
    var buttonArray:[UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(sendText)
        buttonArray = [firstbutton,secondbutton,thirdbutton,fourthbutton,fifthbutton,sixthbutton]
       loadText = iconload.loadcsv()
        
        for i in  0..<loadText.count {
            
            for j in 0..<sendText.count{
                if sendText[j] == loadText[i][1]{
                    buttonArray[j].setBackgroundImage(UIImage(named: loadText[i][2]), forState: .Normal)
                }
            }
            
        }
        
        

        

        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    
}




