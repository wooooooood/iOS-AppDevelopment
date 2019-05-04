//
//  ViewController.swift
//  App0423
//
//  Created by mac on 2019. 4. 23..
//  Copyright © 2019년 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var arrSosi = [["name":"효연", "img":"a1.jpg"],["name":"효연", "img":"a2.jpg"],["name":"효연", "img":"a3.jpg"],["name":"효연", "img":"a4.jpg"],["name":"효연", "img":"a5.jpg"],["name":"효연", "img":"a6.jpg"],["name":"효연", "img":"a7.jpg"],["name":"효연", "img":"a8.jpg"],["name":"효연", "img":"a9.jpg"]]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSosi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let dic = arrSosi[indexPath.row]
        cell.imageView?.image = UIImage(named: dic["img"]!)
        cell.textLabel?.text = dic["name"]
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }


}
