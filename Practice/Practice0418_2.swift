//
//  ViewController.swift
//  App0418_2
//
//  Created by mac on 2019. 4. 18..
//  Copyright © 2019년 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
/*        var cell = tableView.dequeueReusableCell(withIdentifier: "plastic") //optional 반환
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "plastic")
        }*/
        let cell = tableView.dequeueReusableCell(withIdentifier: "plastic", for: indexPath)
        cell.textLabel?.text = "row : \(indexPath.row)"
        cell.detailTextLabel?.text = "details... \(indexPath.row)"
        cell.imageView?.image = UIImage(named: imgArr[indexPath.row])
        return cell
    }
    
 let imgArr = ["a1.jpg","a2.jpg","a3.jpg","a4.jpg","a5.jpg","a6.jpg","a7.jpg","a8.jpg","a9.jpg"]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }


}

휴지통(55)비우기
 
