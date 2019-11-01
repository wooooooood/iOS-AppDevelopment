//
//  ViewController.swift
//  App0514 _ UIImagePickerController
//
//  Created by mac on 2019. 5. 14..
//  Copyright © 2019년 mac. All rights reserved.
//

import UIKit
//uiimagepickercontrollerdel과 navcontrollerdel 같이 써야함
class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var imageView: UIImageView!
    let picker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
    }

    @IBAction func actPhoto(_ sender: Any) {
        let alert = UIAlertController(title: "사진 사용", message: "사진을 어디서 가져올까요?", preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "포토라이브러리", style: .default, handler: handler1)
        alert.addAction(action1)
        
        let action2 = UIAlertAction(title: "촬영", style: .default, handler: handler2)
        alert.addAction(action2)
        
        let action3 = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(action3)
        
        present(alert, animated: true)
    }
    
    func handler1(action:UIAlertAction){
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    
    func handler2(action:UIAlertAction){
        picker.sourceType = .camera
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imageView.image = image
        }
        dismiss(animated: true, completion: nil) //사진 선택 후 선택 화면이 사라짐
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
    }
    
    func getDocumentFolder()->URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentFolder = paths[0]
        print (documentFolder)
        return documentFolder
    }
    
    @IBAction func actSave(_ sender: Any) {
        if let data = imageView.image?.jpegData(compressionQuality: 0.8){
            let filename = getDocumentFolder().appendingPathComponent("sample.png")
            try? data.write(to: filename)
        }
    }
}

