//
//  ViewController.swift
//  App0417_2
//
//  Created by mac on 2019. 4. 17..
//  Copyright © 2019년 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSosi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let person = arrSosi[indexPath.row]
        cell.imageView?.image = UIImage(named: person["img"]!)
        cell.textLabel?.text = person["name"]
        cell.detailTextLabel?.text = "\(indexPath.row+1) 번째 멤버"
        return cell
        
    }
    

    @IBOutlet weak var tableView: UITableView!
    let arr = ["a1.jpg","a2.jpg","a3.jpg","a4.jpg","a5.jpg","a6.jpg","a7.jpg","a8.jpg","a9.jpg"]
    let arrName = ["a","b","c","d","e","f","g","h","i"]
    var arrSosi = [["name":"a", "img":"a1.jpg"],["name":"b", "img":"a2.jpg"],["name":"c", "img":"a3.jpg"],["name":"d", "img":"a4.jpg"],["name":"e", "img":"a5.jpg"],["name":"f", "img":"a6.jpg"],["name":"h", "img":"a7.jpg"],["name":"h", "img":"a8.jpg"],["name":"i", "img":"a9.jpg"]]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    

}
