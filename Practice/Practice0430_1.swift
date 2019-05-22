//
//  TableViewController.swift
//  App0430
//
//  Created by mac on 2019. 4. 30..
//  Copyright © 2019년 mac. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var arrSosi:NSArray? = nil
    override func viewDidLoad() {
        super.viewDidLoad()

        if let path = Bundle.main.path(forResource: "Property List", ofType:"plist") {
            print (path)
            arrSosi = NSArray(contentsOfFile: path)
        }
        
        tableView.rowHeight = 100

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
    
}
휴지통(44)비우기
 
