//
//  ViewController.swift
//  App0416_2
//
//  Created by mac on 2019. 4. 16..
//  Copyright © 2019년 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var label2: UILabel!
    var arr1 = ["SF", "MountainView", "Sunnyvale", "Cupertino", "SantaClara", "SanJose","SD"]
    var arr2 = ["CA", "LA", "NY","OR","FL","HI","AK"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return arr1.count
        }
        return arr2.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return arr1[row]
        }
        return arr2[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            label.text = "\(arr1[row]) selected"
        }
        else {
            label2.text = "\(arr2[row]) selected"
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pickerView.dataSource = self
        pickerView.delegate = self
        
        pickerView.selectRow(2, inComponent: 0, animated: true)
    }


}

 
