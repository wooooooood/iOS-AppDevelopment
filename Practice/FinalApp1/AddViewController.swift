//
//  AddViewController.swift
//  FinalApp1
//
//  Created by mac on 2019. 5. 8..
//  Copyright © 2019년 mac. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var txtGoal: UITextField!
    @IBOutlet weak var txtPerWeek: UITextField!
    
    func getFileName(_ fileName:String) -> String {
        let docsDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docPath = docsDir[0] as NSString
        let fullName = docPath.appendingPathComponent(fileName)
        print(fullName)
        return fullName
    }
    
    var goalList:NSMutableArray?

    @IBAction func actSave(_ sender: Any) {
        let newGoal = ["Goal": txtGoal.text!, "perWeek":txtPerWeek.text!, "cur":[0,0,0,0,0,0,0,0]] as [String : Any]
        goalList?.add(newGoal)
        goalList?.write(toFile: getFileName("Goals.plist"), atomically: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
