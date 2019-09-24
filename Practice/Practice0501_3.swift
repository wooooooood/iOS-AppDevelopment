
App0501_3_WebViewTest
//
//  ViewController.swift
//  App0501_3_WebViewTest
//
//  Created by mac on 2019. 5. 1..
//  Copyright © 2019년 mac. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController {

    @IBOutlet weak var btnG: UIButton!
    @IBOutlet weak var btnN: UIButton!
    @IBOutlet weak var btnD: UIButton!
    @IBOutlet weak var webView: WKWebView!
    let str = ""
    override func viewDidLoad() {
        super.viewDidLoad()
    /*
        if let url = URL(string: str) {
            let request = URLRequest(url: url)
            webView.load(request)
        }*/
    }
    
    @IBAction func clkG(_ sender: Any) {
        let str = "http://google.com"
        if let url = URL(string:str){
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    @IBAction func clkN(_ sender: Any) {
        let str = "http://www.naver.com"
        if let url = URL(string:str){
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    @IBAction func clkD(_ sender: Any) {
        let str = "http://www.daum.net"
        if let url = URL(string: str){
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
}
