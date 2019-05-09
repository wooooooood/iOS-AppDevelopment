//
//  MainTableViewController.swift
//  App0424_2
//
//  Created by mac on 2019. 4. 24..
//  Copyright © 2019년 mac. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    var arrSosi = [["name":"효연", "img":"a1.jpg"],["name":"ㅈㅅㅋ", "img":"a2.jpg"],["name":"ㅅㅎ", "img":"a3.jpg"],["name":"ㅅㅇ", "img":"a4.jpg"],["name":"ㅆㄴ", "img":"a5.jpg"],["name":"ㅌㅇ", "img":"a6.jpg"],["name":"ㅌㅍㄴ", "img":"a7.jpg"],["name":"ㅇㅇ", "img":"a8.jpg"],["name":"ㅇㄹ", "img":"a9.jpg"]]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSosi.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let dic = arrSosi[indexPath.row]

        if let lb1 = cell.viewWithTag(1) as? UILabel {
            lb1.text = dic["name"]
        }
        if let lb2 = cell.viewWithTag(2) as? UILabel {
            lb2.text = "GirlsGeneration"
        }
        if let lb3 = cell.viewWithTag(3) as? UILabel {
            lb3.text = "\(indexPath.row+1)번째 멤버"
        }
        if let imgView = cell.viewWithTag(4) as? UIImageView {
            imgView.image = UIImage(named: dic["img"]!)
        }
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 100
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     
    //seue동작 전 실행
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let indexPath = tableView.indexPathForSelectedRow {
            let dst = segue.destination as? DetailViewController  //오른쪽 뷰 컨트롤러가 걍 이거임
            
            dst?.member = arrSosi[indexPath.row]
        }
    }
    
    //edit 모드. 이동하려면 들어와야함
    @IBAction func actEdit(_ sender: Any) {
        tableView.isEditing = true;
    }
    
    // 드래그해서 이동시키는것
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let temp = arrSosi[fromIndexPath.row]
        arrSosi.remove(at:fromIndexPath.row)
        arrSosi.insert(temp, at:to.row)
    }
    
}
