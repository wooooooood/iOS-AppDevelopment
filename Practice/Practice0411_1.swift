//
//  ViewController.swift
//  App0411
//
//  Created by mac on 2019. 4. 11..
//  Copyright © 2019년 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func actSliderValueChange(_ sender: Any) {
        label.text = "Slider value: \(slider.value)"
    }
    @IBAction func actSwitch(_ sender: Any) {
        if switch1.isOn {
            label.text = "Switch on"
        }
        else {
            label.text = "Switch off"
        }
    }
    @IBAction func actStepperValueChange(_ sender: Any) {
        label.text = "Stepper value: \(stepper.value)"
    }
    @IBAction func actDateCHanged(_ sender: Any) {
        let date = datePicker.date
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy-MM-dd HH:mm:ss"
        label.text = dateFormatter.string(from: date)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        slider.maximumValue = 100
        slider.minimumValue = -100
        slider.value = 0
        
        stepper.minimumValue = 0
        stepper.maximumValue = 1
        stepper.stepValue = 0.3
        stepper.value = 0
    }


}
