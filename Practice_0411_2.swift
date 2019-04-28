// 
//  ViewController.swift
//  ImageView
//
//  Created by mac on 2019. 4. 11..
//  Copyright © 2019년 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var index = 0
    let arr = ["a1.jpg", "a2.jpg", "a3.jpg", "a4.jpg", "a5.jpg", "a6.jpg", "a7.jpg", "a8.jpg", "a9.jpg"]
    var image = UIImage(named: "a1.jpg")
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var btnPrev: UIButton!
    @IBOutlet weak var btnNext: UIButton!
//    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var pgControl: UIPageControl!
    @IBOutlet weak var count: UILabel!
    @IBAction func clickPrev(_ sender: Any) {
        index-=1
        if (index<0) {index += arr.count}
//        slider.value = Float(index)
        pgControl.currentPage = index
        image = UIImage(named: arr[index])  //refactor blocked?
        imageView.image = image
        count.text = "\(index+1)/\(arr.count)"
    }
    @IBAction func clickNext(_ sender: Any) {
        index+=1
        if (index>arr.count-1) {index -= arr.count}
//        slider.value = Float(index)
        pgControl.currentPage = index
        image = UIImage(named: arr[index])
        imageView.image = image
        count.text = "\(index+1)/\(arr.count)"
    }
 /*   @IBAction func moveSlider(_ sender: Any) {
        index = Int(slider.value)
        image = UIImage(named: arr[index])
        imageView.image = image
        count.text = "\(index+1)/\(arr.count)"
    }*/
    @IBAction func PgControl(_ sender: Any) {
        index = pgControl.currentPage
        image = UIImage(named: arr[index])
        imageView.image = image
        count.text = "\(index+1)/\(arr.count)"
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        slider.maximumValue = 8
//        slider.minimumValue = 0
//        slider.value = 0
        pgControl.numberOfPages = arr.count
    }


}
