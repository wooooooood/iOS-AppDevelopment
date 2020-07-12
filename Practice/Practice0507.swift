// 네이티브 앱 키
// REST API 키
// JavaScript 키
// Admin 키

// curl -v -X GET "https://dapi.kakao.com/v3/search/book?target=title" \
// --data-urlencode "query=미움받을 용기" \
// -H "Authorization: KakaoAK restAPI키"

//
//  MainTableViewController.swift
//  App0507
//
//  Created by mac on 2019. 5. 7..
//  Copyright © 2019년 mac. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController, UISearchBarDelegate {
    let apiKey = "***"
    var books:[[String:Any]]?
    var page = 1
    var size = 15
    var query = ""
    
    @IBOutlet weak var searchBar: UISearchBar!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        searchBar.delegate = self
    }

    // MARK: - Table view data source
    @IBAction func actPrev(_ sender: Any) {
        if (page != 1) {
            page -= 1
        }
        search(target: query, page: page, size: size)   //text는 아무것도 안 넣었을 수 있으므로 optional이다
    }
    @IBAction func actNext(_ sender: Any) {
        page += 1
        search(target: query, page: page, size: size)   //text는 아무것도 안 넣었을 수 있으므로 optional이다
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        page = 1
        if let q = searchBar.text {
            query = q
            search(target: query, page: page, size: size)   //text는 아무것도 안 넣었을 수 있으므로 optional이다
        }
        
        searchBar.resignFirstResponder() //search를 완료하고 나면 폰의 키보드가 내려감(없어짐)
    }
    
    func search(target:String, page:Int, size:Int) {
        let strURL = "https://dapi.kakao.com/v3/search/book?query=\(target)&page=\(page)&size=\(size)" as NSString  //한글 되게 하려면 NSString해야함
        let strURL1 = strURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        if let url = URL(string: strURL1!){    //url형식에 맞는지..
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("KakaoAK \(apiKey)", forHTTPHeaderField: "Authorization")
            
            let session = URLSession.shared
            let task = session.dataTask(with: request, completionHandler: completionHandler)
            task.resume()  //이걸 해야 실행됨
        }
    }
    
    func completionHandler(data:Data?, response:URLResponse?, error:Error?){
        if let data = data {
//            print (data)  byte로만 된    
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]{
                    books = json["documents"] as? [[String:Any]]
//                    print (books)
                    
                    DispatchQueue.main.async {   //insert mainQ
                        self.tableView.reloadData()
                    }
                }
                
            } catch {
                
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let books = books {     //파란books는 위에서 만든 것, let books는 새로 만들어서 여기에서만 쓰는 것
            return books.count
        }
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let imageView = cell.viewWithTag(5) as? UIImageView
        let lblTitle = cell.viewWithTag(1) as? UILabel
        let lblPub = cell.viewWithTag(2) as? UILabel
        let lblAuthor = cell.viewWithTag(3) as? UILabel
        let lblPrice = cell.viewWithTag(4) as? UILabel
        

        if let books = books{            
            let book = books[indexPath.row]
            
            lblTitle?.text = book["title"] as? String
            lblPub?.text = book["publisher"] as? String
            let authors = book["authors"] as? [String]
            lblAuthor?.text = authors?.joined(separator: ",")
            let price = book["price"] as? Int
            lblPrice?.text = "\(price ?? 0)"
            
            if let strURL = book["thumbnail"] as? String {
                if let url = URL(string: strURL) {
                    do {
                        let data = try Data (contentsOf: url)
                        let image = UIImage(data: data)
                        imageView?.image = image   //contents mode - aspect fit (비율유지)
                    } catch {
                        
                    }
                }
            }
        }
        
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //뭔가 선택되었을 때 segue로 넘어간다. tableView에게 뭐가 선택되었는지 확인 = indexPath가 뭔지 확인
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            if let books = books {    //let book = books?[indexPath.row]로 153,154줄 나타낼 수 있다
                let book = books[indexPath.row]
                let strURL = book["url"] as? String
                
                if let detailVC = segue.destination as? DetailViewController {
                    detailVC.strURL = strURL
                }
            }
        }
    }
}



//
//  DetailViewController.swift
//  App0507
//
//  Created by mac on 2019. 5. 8..
//  Copyright © 2019년 mac. All rights reserved.
//

import UIKit
import WebKit     //webview사용 위해

class DetailViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    var strURL:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let strURL = strURL {
            if let url = URL(string: strURL) {
                let request = URLRequest(url: url)
                webView.load(request)
            }
        }
    }
}
