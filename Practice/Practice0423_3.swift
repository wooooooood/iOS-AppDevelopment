///
//  ViewController.swift
//  App0423
//
//  Created by mac on 2019. 4. 23..
//  Copyright © 2019년 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return arrShn.count
        } else {
            return arrExo.count
        }
    }
    
    let arrShn = ["on", "jh", "mh","ky","tm"]
    let arrExo = ["xm","do","ch","bh","sh","ki","ly","cy","sh"]
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let imageView = UIImageView()
        if section == 0 {
            let image = UIImage(named:"shnHeader.jpg")
            imageView.image = image
        } else {
            imageView.image = UIImage(named: "exoHeader.jpg")
        }
        return imageView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0 {
            return "Shn footer"
        } else {
            return "Exo footer"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if indexPath.section == 0 {
            cell.textLabel?.text = "\(arrShn[indexPath.row])"
        } else {
            cell.textLabel?.text = "\(arrExo[indexPath.row])"
        }
        
        switch indexPath.row%5 {
        case 0: cell.accessoryType = .checkmark
        case 1: cell.accessoryType = .detailButton
        case 2: cell.accessoryType = .detailDisclosureButton
        case 3: cell.accessoryType = .disclosureIndicator
        case 4: cell.accessoryType = .none
        default: cell.accessoryType = .none
        }
        
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }


}

