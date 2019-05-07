//
//  ViewController.swift
//  App0423
//
//  Created by mac on 2019. 4. 23..
//  Copyright © 2019년 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var arrSosi = [["name":"효연", "img":"a1.jpg"],["name":"ㅈㅅㅋ", "img":"a2.jpg"],["name":"ㅅㅎ", "img":"a3.jpg"],["name":"ㅅㅇ", "img":"a4.jpg"],["name":"ㅆㄴ", "img":"a5.jpg"],["name":"ㅌㅇ", "img":"a6.jpg"],["name":"ㅌㅍㄴ", "img":"a7.jpg"],["name":"ㅇㅇ", "img":"a8.jpg"],["name":"ㅇㄹ", "img":"a9.jpg"]]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSosi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dic = arrSosi[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let imgView = cell.viewWithTag(1) as? UIImageView {
            imgView.image = UIImage(named: dic["img"]!)
        }
        
        if let lbl1 = cell.viewWithTag(2) as? UILabel {
            lbl1.text = dic["name"]
        }
        if let logoView = cell.viewWithTag(5) as? UIImageView {
            logoView.image = UIImage(named:"girlsgenerationHeader.jpg")
        }
        if let lbl2 = cell.viewWithTag(3) as? UILabel {
            lbl2.text = "girlsgeneration"
        }
        if let lbl3 = cell.viewWithTag(4) as? UILabel {
            lbl3.text = "\(indexPath.row) member"
        }
        return cell
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
}
