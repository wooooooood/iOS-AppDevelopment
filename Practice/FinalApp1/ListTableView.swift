//
//  ListTableView.swift
//  FinalApp1
//
//  Created by mac on 2019. 5. 7..
//  Copyright © 2019년 mac. All rights reserved.
//

import UIKit

class ListTableView: UITableViewController {
    var goalList:NSMutableArray? = nil
    
    var goalCur:[Int] = []
    var goalCurCount = 0
    var goalPer:String = ""
    var lblProgress:UILabel? = nil
    
    func getFileName(_ fileName:String) -> String {
        let docsDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docPath = docsDir[0] as NSString
        let fullName = docPath.appendingPathComponent(fileName)
        print(fullName)
        return fullName
    }
    
    func getCurCount () -> Int{
        goalCurCount = 0
        for i in 0..<7 {
            if goalCur[i] == 1 {
                goalCurCount += 1
            }
        }
        return goalCurCount;
    }
    
    override func viewWillAppear(_ animated: Bool){
        tableView.reloadData()
    } //data 변하는 순간에 해줘야 반영됨
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 150
        
        if let path = Bundle.main.path(forResource: "Goals", ofType:"plist") {
            //print (path)
            goalList = NSMutableArray(contentsOfFile: path)
        }
        
    }
    
    // MARK: - Table view data source
    @IBAction func chkSun(_ sender: CheckboxButton) {
        let state = sender.on ? "ON" : "OFF"
        
        let cell = sender.superview?.superview as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)
        
        //        print (indexPath?[1] as! Int)
        
        if let array = goalList {
            if var goal = array[indexPath?.row ?? 0] as? [String:Any]{
                
                goalCur = goal["cur"] as! [Int]
                goalCur[0] = sender.on ? 1 : 0
                goalPer = goal["perWeek"] as! String
                
                lblProgress = cell.viewWithTag(2) as? UILabel
                
                goalCur[7] = 0
                for i in 0..<7{
                    goalCur[7] += goalCur[i]
                }
                
                
                goalList?.write(toFile: getFileName("Goals.plist"), atomically: true)
                print (goalCur)
                
                lblProgress?.text = "\(goalCur[7]) / \(goalPer)"
            }
        }
        print("CheckboxButton: did turn \(state)")
    }

    @IBAction func chkMon(_ sender: CheckboxButton) {

        let cell = sender.superview?.superview as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)
        
//        print (indexPath?[1] as! Int)

        if let array = goalList {
            if var goal = array[indexPath?.row ?? 0] as? [String:Any]{

                goalCur = goal["cur"] as! [Int]
                goalCur[1] = sender.on ? 1 : 0
                goalPer = goal["perWeek"] as! String
                
                lblProgress = cell.viewWithTag(2) as? UILabel
                goalCur[7] = 0
                for i in 0..<7{
                    goalCur[7] += goalCur[i]
                }
                
                
                goalList?.write(toFile: getFileName("Goals.plist"), atomically: true)
                print (goalCur)
                
                lblProgress?.text = "\(goalCur[7]) / \(goalPer)"
            }
        }
    }
    @IBAction func chkTue(_ sender: CheckboxButton) {
        
        let cell = sender.superview?.superview as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)
        
        //        print (indexPath?[1] as! Int)
        
        if let array = goalList {
            if let goal = array[indexPath?.row ?? 0] as? [String:Any]{
                
                goalCur = goal["cur"] as! [Int]
                goalCur[2] = sender.on ? 1 : 0
                goalPer = goal["perWeek"] as! String
                
                lblProgress = cell.viewWithTag(2) as? UILabel
                goalCur[7] = 0
                for i in 0..<7{
                    goalCur[7] += goalCur[i]
                }
                
                lblProgress?.text = "\(goalCur[7]) / \(goalPer)"
            }
        }
    }
    @IBAction func chkWed(_ sender: CheckboxButton) {
        
        let cell = sender.superview?.superview as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)
        
        //        print (indexPath?[1] as! Int)
        
        if let array = goalList {
            if let goal = array[indexPath?.row ?? 0] as? [String:Any]{
                
                goalCur = goal["cur"] as! [Int]
                goalCur[3] = sender.on ? 1 : 0
                goalPer = goal["perWeek"] as! String
                
                lblProgress = cell.viewWithTag(2) as? UILabel
                
                lblProgress?.text = "\(getCurCount()) / \(goalPer)"
            }
        }
    }
    @IBAction func chkThu(_ sender: CheckboxButton) {
        
        let cell = sender.superview?.superview as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)
        
        //        print (indexPath?[1] as! Int)
        
        if let array = goalList {
            if let goal = array[indexPath?.row ?? 0] as? [String:Any]{
                
                goalCur = goal["cur"] as! [Int]
                goalCur[4] = sender.on ? 1 : 0
                goalPer = goal["perWeek"] as! String
                
                lblProgress = cell.viewWithTag(2) as? UILabel
                
                lblProgress?.text = "\(getCurCount()) / \(goalPer)"
            }
        }
    }
    @IBAction func chkFri(_ sender: CheckboxButton) {
        
        let cell = sender.superview?.superview as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)
        
        //        print (indexPath?[1] as! Int)
        
        if let array = goalList {
            if let goal = array[indexPath?.row ?? 0] as? [String:Any]{
                
                goalCur = goal["cur"] as! [Int]
                goalCur[5] = sender.on ? 1 : 0
                goalPer = goal["perWeek"] as! String
                
                lblProgress = cell.viewWithTag(2) as? UILabel
                
                lblProgress?.text = "\(getCurCount()) / \(goalPer)"
            }
        }
    }
    @IBAction func chkSat(_ sender: CheckboxButton) {
        
        let cell = sender.superview?.superview as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)
        
        //        print (indexPath?[1] as! Int)
        
        if let array = goalList {
            if let goal = array[indexPath?.row ?? 0] as? [String:Any]{
                
                goalCur = goal["cur"] as! [Int]
                goalCur[6] = sender.on ? 1 : 0
                goalPer = goal["perWeek"] as! String
                
                lblProgress = cell.viewWithTag(2) as? UILabel
                
                lblProgress?.text = "\(getCurCount()) / \(goalPer)"
            }
        }
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let array = goalList {
            return array.count
        } else {
            return 0
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if let array = goalList {
            if let goal = array[indexPath.row] as? [String:Any]{
                let goalTitle = goal["Goal"]
                let lblTitle = cell.viewWithTag(1) as? UILabel
                lblTitle?.text = goalTitle as! String
                
                goalCur = goal["cur"] as! [Int]
                goalPer = goal["perWeek"] as! String
                
                goalCur[7] = 0
                for i in 0..<7{
                    goalCur[7] += goalCur[i]
                }
                
                lblProgress = cell.viewWithTag(2) as? UILabel
                lblProgress?.text = "\(goalCur[7]) / \(goalPer)"
                
            }
        }
        
        return cell
    }
    
    
    
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
    
    
    
     // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            goalList?.removeObject(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade) // 했는데 실제로 앱에서 삭제하면 앱터짐
            goalList?.write(toFile: ("Goals.plist"), atomically: true) //삭제한 obj를 plist에서도 삭제
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
     }
    
    
    
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        if let array = goalList,let temp = array[fromIndexPath.row] as? [String:Any] {
            array.removeObject(at: fromIndexPath.row)
            array.insert(temp, at: to.row)
            array.write(toFile: ("Goals.plist"), atomically: true)
        }
     }
    
    
    
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let target = segue.destination as? AddViewController {
            target.goalList = goalList
        }
    }
 
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
 
    */
}
