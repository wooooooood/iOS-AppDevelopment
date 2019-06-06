//
//  TableViewController.swift
//  App0430
//
//  Created by mac on 2019. 4. 30..
//  Copyright © 2019년 mac. All rights reserved.
//

import UIKit
/*
func getFileName(_ fileName:String) -> String {
    let docsDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    let docPath = docsDir[0] as NSString
    let fullName = docPath.appendingPathComponent(fileName)
    print(fullName)
    return fullName
} //함수형 언어 기능 : 글로벌 함수 되었다
*/
class TableViewController: UITableViewController {
    var arrSosi:NSMutableArray?
    
    func getFileName(_ fileName:String) -> String {
        let docsDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docPath = docsDir[0] as NSString
        let fullName = docPath.appendingPathComponent(fileName)
        print(fullName)
        return fullName
    }
    
    override func viewWillAppear(_ animated: Bool){
        tableView.reloadData()
    } //data 변하는 순간에 해줘야 반영됨
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if let path = Bundle.main.path(forResource: "Property List", ofType:"plist") {
            print (path)
            arrSosi = NSMutableArray(contentsOfFile: path)
        }
        
        let targetDir = getFileName("Property List.plist")
        print (targetDir)
        tableView.rowHeight = 100
        
        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: targetDir) {
            let orgPath = Bundle.main.path(forResource: "Property List", ofType: "plist")
            do {
                try fileManager.copyItem(atPath: orgPath!, toPath: targetDir)
            } catch {
                print ("Failed to copy file")
            }
        }
        self.navigationItem.rightBarButtonItem = self.editButtonItem;
        //https://stackoverflow.com/questions/1219779/how-to-add-a-right-button-to-a-uinavigationcontroller
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let array = arrSosi {
            return array.count
        } else {
            return 0
        }
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let array = arrSosi {
            // Configure the cell...
                if let member = array[indexPath.row] as? [String:String]{
                let name = member["name"]
                let fileName = member["img"]
                let dsc = member["dsc"]
                    
                let imageView = cell.viewWithTag(1) as? UIImageView
                let lblDsc = cell.viewWithTag(2) as? UILabel
                let lblName = cell.viewWithTag(3) as? UILabel
                    
                imageView?.image = UIImage(named: fileName!)
                lblName?.text = name
                lblDsc?.text = dsc
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
            arrSosi?.removeObject(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade) // 했는데 실제로 앱에서 삭제하면 앱터짐
            arrSosi?.write(toFile: getFileName("Property List.plist"), atomically: true) //삭제한 obj를 plist에서도 삭제
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        if let array = arrSosi,let temp = array[fromIndexPath.row] as? [String:String] {
            array.removeObject(at: fromIndexPath.row)
            array.insert(temp, at: to.row)
            array.write(toFile: getFileName("Property List.plist"), atomically: true)
        }
    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let target = segue.destination as? AddViewController {
            target.arrSosi = arrSosi
        }
    }
    

}
/*
 var arrSosi:NSMutableArray?
 
 func getFileName(_ fileName:String) -> String {
    let docsDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    let docPath = docsDir[0] as NSString
    let fullName = docPath.appendingPathComponent(fileName)
    print(fullName)
    return fullName
 */


//
//  AddViewController.swift
//  App0430
//
//  Created by mac on 2019. 5. 1..
//  Copyright © 2019년 mac. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var btnSave: UIButton!
    
    func getFileName(_ fileName:String) -> String {
        let docsDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docPath = docsDir[0] as NSString
        let fullName = docPath.appendingPathComponent(fileName)
        print(fullName)
        return fullName
    }
    
    var arrSosi:NSMutableArray?
    @IBAction func actSave(_ sender: Any) {
        let newMember = ["name": textName.text!, "img":"a1.jpg"]
        arrSosi?.add(newMember)
        arrSosi?.write(toFile: getFileName("Property List.plist"), atomically: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
