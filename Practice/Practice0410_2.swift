//
//  ViewController.swift
//  App0410_2
//
//  Created by mac on 2019. 4. 10..
//  Copyright © 2019년 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lab1: UILabel!
    @IBOutlet weak var seg1: UISegmentedControl!
    @IBOutlet weak var txt: UITextField!
    @IBAction func SegClick(_ sender: Any) {
        lab1.text = "\(seg1.selectedSegmentIndex+1)times clicked"
    }
    @IBAction func txtfld(_ sender: Any) {
//        txt.resignFirstResponder()
        lab1.text = txt.text
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        seg1.setTitle("4th", forSegmentAt: 3)
        seg1.setEnabled(false,forSegmentAt: 2)
        seg1.selectedSegmentIndex = 1
    }


}

