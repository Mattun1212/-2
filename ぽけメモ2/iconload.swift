//
//  iconload.swift
//  ぽけメモ2
//
//  Created by マツシタ コウタロウ on 2016/11/10.
//  Copyright © 2016年 マツシタ コウタロウ. All rights reserved.
//

import UIKit

class IconLoad: NSObject {
    
    func  loadcsv()->[[String]]{
        var resultArray = [[String]]()
        var count = 0
        let csvBundle = NSBundle.mainBundle().pathForResource("pokemonData", ofType: "csv")
        do {
            var csvData: String = try String(contentsOfFile: csvBundle!, encoding: NSUTF8StringEncoding)
            csvData = csvData.stringByReplacingOccurrencesOfString("\r", withString: "")
            let csvArray = csvData.componentsSeparatedByString("\n")
            print(csvArray)
            for line in csvArray {
                let parts = line.componentsSeparatedByString(",")
                
//                print(parts)
//                for i in 0...2{
                    resultArray.append(parts)
                    
//                }
                
                count++
                
            }
            print(resultArray)
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return resultArray
    }

    }
