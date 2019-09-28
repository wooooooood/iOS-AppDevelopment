App0502
//
//  ViewController.swift
//  App0502_1
//
//  Created by mac on 2019. 5. 2..
//  Copyright © 2019년 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func actionHandler1(action: UIAlertAction){
        print ("action1 clicked")
    }
    
    func actionHandler2(action: UIAlertAction){
        print ("action2 clicked")
    }
    
    func actionHandler3(action: UIAlertAction){
        print ("action3 clicked")
    }
    
    @IBAction func btnClk(_ sender: Any) {
        let alert = UIAlertController(title: "Title", message: "알려드립니다", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(action1)
        
        present(alert, animated: true, completion: nil)
    }
    func aaa(){
        print ("aaa실행")
    }
    @IBAction func btn2Clk(_ sender: Any) {
        let alert = UIAlertController(title: "Title", message: "알려드립니다", preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(action1)
        let action2 = UIAlertAction(title: "취소", style: .cancel, handler: {
                                                                            action in
                                                                                print("btn2 action2 clicked")
                                                                            })    //클로즈?
        alert.addAction(action2)
        
        present(alert, animated: true, completion: aaa)
    }
    @IBAction func btn3Clk(_ sender: Any) {
        let alert = UIAlertController(title: "Title", message: "알려드립니다", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "확인", style: .default, handler: actionHandler1)
        alert.addAction(action1)
        let action2 = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(action2)
        let action3 = UIAlertAction(title: "삭제", style: .destructive, handler: actionHandler3)
        alert.addAction(action3)
        
        present(alert, animated: true, completion: nil)
    }
    

}

