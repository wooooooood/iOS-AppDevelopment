//
//  ViewController.swift
//  App0410
//
//  Created by mac on 2019. 4. 10..
//  Copyright © 2019년 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testLabel1: UILabel!
    @IBOutlet weak var testButton1: UIButton!
    var count = 0
    
    @IBAction func btnTouched(_ sender: Any) {
        count+=1
        testLabel1.text = "\(count) pushed"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let view1 = UIView()
        view1.frame = CGRect(x: 100, y: 100, width: 200, height:200)
        let color = UIColor(red:0.1, green:0.2, blue: 1.0,alpha:0.8)
        view1.backgroundColor = color
        
        let label1 = UILabel()
        label1.frame = CGRect(x:150, y:300, width:200, height: 50)
        label1.text = "Hello world"
        label1.font = UIFont.systemFont(ofSize:30)
        
        testButton1.title(for:.normal)
        
        view.addSubview(view1)
        view.addSubview(label1)
        
    }

}
