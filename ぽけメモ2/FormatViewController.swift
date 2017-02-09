//
//  FormatViewController.swift
//  ぽけメモ2
//
//  Created by マツシタ コウタロウ on 2016/09/01.
//  Copyright © 2016年 マツシタ コウタロウ. All rights reserved.
//

import UIKit

class FormatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
     var formatArray = [String]()
    var tapIndex: Int!
    let saveData: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
        formatArray = ["シングル" , "ダブル", "WCS"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
       func tableView(tableView: UITableView, numberOfRowsInSection selection: Int) -> Int {
        return formatArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        cell?.textLabel?.text = formatArray[indexPath.row]
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        NSLog("%@が選ばれました", formatArray[indexPath.row])
        tapIndex = indexPath.row
        
        //遷移
        performSegueWithIdentifier("toFirst", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // 次の画面に値を渡したい場合はここに書く
        let firstViewController = segue.destinationViewController as! FirstViewController
        // ここに値渡しのコード
        firstViewController.recieveIndex = tapIndex
        
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
