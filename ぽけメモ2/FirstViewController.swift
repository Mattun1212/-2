//
//  FirstViewController.swift
//  ぽけメモ2
//
//  Created by マツシタ コウタロウ on 2015/12/03.
//  Copyright © 2015年 マツシタ コウタロウ. All rights reserved.
//


/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++
やること
・タップして縮まない DONE
・削除機能
・画面遷移でバグる
・情報の保存手法


++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

import UIKit
import RealmSwift

class FirstViewController: UIViewController , UITableViewDataSource, UITableViewDelegate,InputTextTableCellDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var recieveIndex :Int!
    
    // セルに表示させる内容を保存した配列
    //    var titleSingleArray = [String]()
    //    var contentSingleArray = [String]()
    //    var titleDoubleArray = [String]()
    //    var contentDoubleArray = [String]()
    //    var titleTripleArray = [String]()
    //    var contentTripleArray = [String]()
    //    var partytitleSingleArray = [String]()
    //    var partycontentArray = [String]()
    //    var partytitleDoubleArray = [String]()
    //    var partycontentDoubleArray = [String]()
    //    var partytitleTripleArray = [String]()
    //    var partycontentTripleArray = [String]()
    var titleSingleArray:[String]!//["aaaaa","aaaa","aaa","aa","a"]
    var contentSingleArray:[String]!// = ["aaaaa","aaaa","aaa","aa","a"]
    var titleDoubleArray:[String]!// = ["aaaaa","aaaa","aaa","aa","a"]
    var contentDoubleArray:[String]!// = ["aaaaa","aaaa","aaa","aa","a"]
    var titleTripleArray:[String]!// = ["aaaaa","aaaa","aaa","aa","a"]
    var contentTripleArray:[String]!// = ["aaaaa","aaaa","aaa","aa","a"]
    var partytitleSingleArray:[String]!// = ["aaaaa","aaaa","aaa","aa","a"]
    var partycontentArray:[String]!// = ["aaaaa","aaaa","aaa","aa","a"]
    var partytitleDoubleArray:[String]!// = ["aaaaa","aaaa","aaa","aa","a"]
    var partycontentDoubleArray:[String]!// = ["aaaaa","aaaa","aaa","aa","a"]
    var partytitleTripleArray:[String]!// = ["aaaaa","aaaa","aaa","aa","a"]
    var partycontentTripleArray:[String]!// = ["aaaaa","aaaa","aaa","aa","a"]
    
    let saveData: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    private var sections: [(title: String, details: [String], extended: Bool)] = []
    private let RootCellIdentifier = "RootCellIdentifier"
    private let SubCellIdentifier = "SubCellIdentifier"
    private let extendedSections = NSMutableIndexSet()
    private let numberOfRowInSection = 7
    
    
    
    // 何番目のセルがタップされたかを保存しておく変数
    var tappedCellIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem()
        self.tableView.registerClass(TableViewRootCell.self, forCellReuseIdentifier: RootCellIdentifier)
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: SubCellIdentifier)
        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        
        let userDefault = NSUserDefaults.standardUserDefaults()
        var appDomain:String = NSBundle.mainBundle().bundleIdentifier!
        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain)
        
        userDefault.setObject((["ts1","ts2","ts3","ts4","ts5","ts6","ts7"]), forKey:"titleSingleArray")
        userDefault.setObject((["aaaaa","aaaa","aaa","aa","a"]), forKey:"contentSingleArray")
        userDefault.setObject((["aaaaa","aaaa","aaa","aa","a"]), forKey:"partySingleArray")
        userDefault.setObject((["aaaaa","aaaa","aaa","aa","a"]), forKey:"partycontentSingleArray")
        userDefault.setObject((["aaaaa","aaaa","aaa","aa","a"]), forKey:"titleDoubleArray")
        userDefault.setObject((["aaaaa","aaaa","aaa","aa","a"]), forKey:"contentDoubleArray")
        userDefault.setObject((["aaaaa","aaaa","aaa","aa","a"]), forKey:"partyDoubleArray")
        userDefault.setObject((["aaaaa","aaaa","aaa","aa","a"]), forKey:"partycontentDoubleArray")
        userDefault.setObject((["aaaaa","aaaa","aaa","aa","a"]), forKey:"titleTripleArray")
        userDefault.setObject((["aaaaa","aaaa","aaa","aa","a"]), forKey:"contentTripleArray")
        userDefault.setObject((["aaaaa","aaaa","aaa","aa","a"]), forKey:"partyTripleArray")
        userDefault.setObject((["aaaaa","aaaa","aaa","aa","a"]), forKey:"partycontentTripleArray")
        //==================================
        //        NSUserDefaults.standardUserDefaults().setObject(nil, forKey: "partytitleSingleArray")
        //            objectForKey("partytitleSingleArray") != nil
        //==================================
    }
    
    override func viewWillAppear(animated: Bool) {
        if recieveIndex == 0 {
            if NSUserDefaults.standardUserDefaults().objectForKey("titleSingleArray") != nil {
                //            print(NSUserDefaults.standardUserDefaults().objectForKey("titleArray"))
                titleSingleArray = NSUserDefaults.standardUserDefaults().objectForKey("titleSingleArray") as! [String]
            }
            
            if NSUserDefaults.standardUserDefaults().objectForKey("contentSingleArray") != nil {
                contentSingleArray = NSUserDefaults.standardUserDefaults().objectForKey("contentSingleArray") as! [String]
            }
            
            if NSUserDefaults.standardUserDefaults().objectForKey("partytitleSingleArray") != nil {
                //            print(NSUserDefaults.standardUserDefaults().objectForKey("titleArray"))
                titleSingleArray = NSUserDefaults.standardUserDefaults().objectForKey("partytitleSingleArray") as! [String]
                sections.append((title: titleSingleArray[0], details: titleSingleArray!, extended: false))
            }
            
            if NSUserDefaults.standardUserDefaults().objectForKey("partycontentSingleArray") != nil {
                contentSingleArray = NSUserDefaults.standardUserDefaults().objectForKey("partycontentSingleArray") as! [String]
                
            }
            
            
            
            //            sections.append((title: "name", details: contentSingleArray, extended: false))
            
            //       tableViewをリロード
            tableView.reloadData()
            print(titleSingleArray)
        }
        
        if recieveIndex == 1 {
            if NSUserDefaults.standardUserDefaults().objectForKey("titleDoubleArray") != nil {
                //            print(NSUserDefaults.standardUserDefaults().objectForKey("titleArray"))
                titleDoubleArray = NSUserDefaults.standardUserDefaults().objectForKey("titleDoubleArray") as! [String]
            }
            
            if NSUserDefaults.standardUserDefaults().objectForKey("contentDoubleArray") != nil {
                contentDoubleArray = NSUserDefaults.standardUserDefaults().objectForKey("contentDoubleArray") as! [String]
            }
            
            if NSUserDefaults.standardUserDefaults().objectForKey("partytitleDoubleArray") != nil {
                //            print(NSUserDefaults.standardUserDefaults().objectForKey("titleArray"))
                titleDoubleArray = NSUserDefaults.standardUserDefaults().objectForKey("partytitleDoubleArray") as! [String]
            }
            
            if NSUserDefaults.standardUserDefaults().objectForKey("partycontentDoubleArray") != nil {
                contentDoubleArray = NSUserDefaults.standardUserDefaults().objectForKey("partycontentDoubleArray") as! [String]
            }
            
            
            sections.append((title: titleDoubleArray[0], details: titleDoubleArray, extended: false))
            
            
            
            //       tableViewをリロード
            tableView.reloadData()
            print(titleDoubleArray)
        }
        
        if recieveIndex == 2 {
            if NSUserDefaults.standardUserDefaults().objectForKey("titleTripleArray") != nil {
                //            print(NSUserDefaults.standardUserDefaults().objectForKey("titleArray"))
                titleTripleArray = NSUserDefaults.standardUserDefaults().objectForKey("titleTripleArray") as! [String]
            }
            
            if NSUserDefaults.standardUserDefaults().objectForKey("contentTripleArray") != nil {
                contentTripleArray = NSUserDefaults.standardUserDefaults().objectForKey("contentTripleArray") as! [String]
            }
            
            if NSUserDefaults.standardUserDefaults().objectForKey("partytitleTripleArray") != nil {
                //            print(NSUserDefaults.standardUserDefaults().objectForKey("titleArray"))
                titleTripleArray = NSUserDefaults.standardUserDefaults().objectForKey("titleTripleArray") as! [String]
            }
            
            if NSUserDefaults.standardUserDefaults().objectForKey("partycontentTripleArray") != nil {
                contentTripleArray = NSUserDefaults.standardUserDefaults().objectForKey("partycontentTripleArray") as! [String]
            }
            
            sections.append((title: titleTripleArray[0], details: titleTripleArray, extended: false))
            
            
            
            //       tableViewをリロード
            tableView.reloadData()
            print(titleTripleArray)
        }
        
    }
    
    
    //tableview 基本+アコーディオン+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    
    private func didSelectRootCell(section: NSInteger) {
        var extended = isSectionExtended(section)
        extended = !extended
        if extended {
            extendedSections.addIndex(section)
        } else {
            extendedSections.removeIndex(section)
        }
        
        let numOfRows = numberOfRowInSection
        var paths = [NSIndexPath]()
        for i in 1..<numOfRows {
            paths.append(NSIndexPath(forRow: i, inSection: section))
        }
        //        tableView.reloadData()
        //        tableView.reloadSections(NSIndexSet(index: section), withRowAnimation: .Automatic)
        
        
        tableView.reloadData()
        
        //        tableView.beginUpdates()
        //        if extended {
        //            tableView.insertRowsAtIndexPaths(paths, withRowAnimation: .Automatic)
        //        } else {
        //            tableView.deleteRowsAtIndexPaths(paths, withRowAnimation: .Automatic)
        //        }
        //        tableView.endUpdates()
        //
        //        UIView.animateWithDuration(0.3) { () -> Void in
        //            if let cell = self.tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: section)) as? TableViewRootCell {
        //                cell.extended = extended
        //            }
        //        }
    }
    
    //セクションが展開してるか否か
    private func isSectionExtended(section: NSInteger) -> Bool {
        return extendedSections.containsIndex(section)
    }
    
    //セクションの数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 5
    }
    
    //セクション内のrowの数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        /***********************************
        *　ここうまく使う
        ***********************************/
        
        //        //   self.sections[section].extended ? sections[section].details.count : 0
        //        if recieveIndex == 0 {
        //            return titleSingleArray.count;
        //        }
        //
        //        if recieveIndex == 1 {
        //            return titleDoubleArray.count;
        //        }
        //
        //        if recieveIndex == 2 {
        //            return titleTripleArray.count;
        //        }
        
        
        return isSectionExtended(section) ? numberOfRowInSection : 1
        
        
    }
    
    
    //セクションのヘッダに表示するビューを決定
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var cell = tableView.dequeueReusableHeaderFooterViewWithIdentifier("Header") as? CustomHeaderFooterView
        if cell == nil {
            cell = CustomHeaderFooterView(reuseIdentifier: "Header")
            cell?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "tapHeader:"))
        }
        /*cell!.textLabel!.text = self.sections[section].title*/
        //        cell!.section = section
        //        cell!.setExpanded(self.sections[section].extended)
        return cell
    }
    
    //ヘッダがタップされたとき
    func tapHeader(gestureRecognizer: UITapGestureRecognizer) {
        guard let cell = gestureRecognizer.view as? CustomHeaderFooterView else {
            return
        }
        let extended = self.sections[cell.section].extended
        self.sections[cell.section].extended = !extended
        tableView.reloadData()  // 追記で、reloadSectionsに変更しています
    }
    
    
    
    
    
    //rowの中のセルの内容を返すように実装する
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //        let cell: InputTextTableCell = tableView.dequeueReusableCellWithIdentifier("InputTextCell", forIndexPath: indexPath)
        //        let cell = tableView.dequeueReusableCellWithIdentifier("InputTextCell", forIndexPath: indexPath) as UITableViewCell!
        //
        // セル内のラベルに、titleArray配列に保存されている内容を、indexPath.row(順番通りに)当てはめる
        
        
        let isRoot = (indexPath.row == 0)
        let identifier = isRoot ? RootCellIdentifier : SubCellIdentifier
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)
        
        if isRoot {
            if let cell = cell as? TableViewRootCell {
                cell.label.text = "Section \(indexPath.section)"
                cell.backgroundColor = UIColor(white: CGFloat(0.5 - 0.5 * Double(indexPath.section) / Double(tableView.numberOfSections)), alpha: 1.0)
                cell.label.textColor = UIColor.whiteColor()
                cell.extended = isSectionExtended(indexPath.section)
            }
            return cell
        } else {
            if recieveIndex == 0 {
                cell.textLabel?.text = titleSingleArray[indexPath.row]
                
            }
            
            if recieveIndex == 1 {
                cell.textLabel?.text = titleDoubleArray[indexPath.row]
                
            }
            
            if recieveIndex == 2 {
                cell.textLabel?.text = titleTripleArray[indexPath.row]
                
            }
            
            //                cell.textLabel?.text = "indexPath(\(indexPath.section), \(indexPath.row))";
        }
        
        
        
        
        return cell
    }
    
    //高さの変更
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let isRoot = indexPath.row == 0
        if isRoot {
            return isSectionExtended(indexPath.section) ? 30 : 60
        } else {
            //return 44
            return InputTextTableCell.height()
        }
        
    }
    
    
    
    
    //rowがタップされたら
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // 何番目が押されたかをtappedCellIndexに保存
        //        tappedCellIndex = indexPath.row
        //
        if indexPath.row == 0 {
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
            let isRoot = (indexPath.row == 0)
            if isRoot {
                didSelectRootCell(indexPath.section)
            }
            
        }else{
            self.performSegueWithIdentifier("toMemo", sender: nil)
        }
        
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.editing = editing
    }
    
    
    
    //tableview 編集系++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        // 先にデータを更新する
        if recieveIndex == 0 {
            titleSingleArray.removeAtIndex(indexPath.row)
            print(titleSingleArray)
            
        }
        
        if recieveIndex == 1 {
            titleDoubleArray.removeAtIndex(indexPath.row)
            print(titleDoubleArray)
            
        }
        
        if recieveIndex == 2 {
            titleTripleArray.removeAtIndex(indexPath.row)
            print(titleTripleArray)
            
        }
        
        
        
        // それからテーブルの更新
        tableView.deleteRowsAtIndexPaths([NSIndexPath(forRow: indexPath.row, inSection: 0)],
            withRowAnimation: UITableViewRowAnimation.Fade)
        if recieveIndex == 0 {
            saveData.setObject(partytitleSingleArray, forKey: "partytitleSingleArray")
            saveData.setObject(partycontentArray, forKey: "partycontentSingleArray")
            saveData.setObject(titleSingleArray, forKey: "titleSingleArray")
            saveData.setObject(contentSingleArray, forKey: "contentSingleArray")
            
        }
        if recieveIndex == 1 {
            saveData.setObject(partytitleDoubleArray, forKey: "partytitleDoubleArray")
            saveData.setObject(partycontentDoubleArray, forKey: "partycontentDoubleArray")
            saveData.setObject(titleDoubleArray, forKey: "titleDoubleArray")
            saveData.setObject(contentDoubleArray, forKey: "contentDoubleArray")
            
        }
        
        if recieveIndex == 2 {
            saveData.setObject(partytitleTripleArray, forKey: "partytitleTripleArray")
            saveData.setObject(partycontentTripleArray, forKey: "partycontentTripleArray")
            saveData.setObject(titleTripleArray, forKey: "titleTripleArray")
            saveData.setObject(contentTripleArray, forKey: "contentTripleArray")
        }
        
        
        
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let targetTitle = titleSingleArray[sourceIndexPath.row]
        
        if let index = titleSingleArray.indexOf(targetTitle) {
            titleSingleArray.removeAtIndex(index)
            titleSingleArray.insert(targetTitle, atIndex: destinationIndexPath.row)
        }
        let targetTitle2 = titleDoubleArray[sourceIndexPath.row]
        if let index = titleDoubleArray.indexOf(targetTitle2) {
            titleDoubleArray.removeAtIndex(index)
            titleDoubleArray.insert(targetTitle2, atIndex: destinationIndexPath.row)
        }
        let targetTitle3 = titleTripleArray[sourceIndexPath.row]
        if let index = titleTripleArray.indexOf(targetTitle3) {
            titleTripleArray.removeAtIndex(index)
            titleTripleArray.insert(targetTitle3, atIndex: destinationIndexPath.row)
            
        }
        
        
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        if tableView.editing {
            return UITableViewCellEditingStyle.Delete
        } else {
            return UITableViewCellEditingStyle.None
        }
        tableView.allowsSelectionDuringEditing = true
    }
    
    
    //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // 次の画面に値を渡したい場合はここに書く
        let memoViewController = segue.destinationViewController as! MemoViewController
        // ここに値渡しのコード
        memoViewController.selectedIndex = tappedCellIndex
        memoViewController.saveIndex = recieveIndex
    }
    
    
    @IBAction func addMemo() {
        //残ってる値のリセット
        tappedCellIndex = nil
        self.performSegueWithIdentifier("toMemo", sender: nil)
        
    }
    
    func textFieldDidEndEditing(cell: InputTextTableCell, value: NSString) -> () {
        let path = tableView.indexPathForRowAtPoint(cell.convertPoint(cell.bounds.origin, toView: tableView))
        NSLog("row = %d, value = %@", path!.row, value)
    }
    
}



