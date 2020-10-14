//
//  BannerDocument.swift
//  BannerWebView
//
//  Created by Amco on 8/21/20.
//  Copyright © 2020 Amco. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class BannerDocument: UIViewController {
    
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var headertext: UILabel!
    @IBOutlet weak var newLbl: UILabel!
    @IBOutlet weak var newsDetailLbl: UILabel!
    
    @IBOutlet weak var urlBtn: UIButton!
    @IBAction func urlBtn(_ sender: Any) {
    }
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var closeBtn: UIButton!
    @IBAction func closeBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var optionBtn: UIButton!
    @IBAction func optionBtn(_ sender: Any) {
    }
    
    @IBOutlet weak var backBtn: UIButton!
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newDocument()

        // Do any additional setup after loading the view.
    }
    func newDocument(){
        
        Alamofire.request("http://api.activemobile.com/?k=0&pid=452&sid=339&zid=561&auth=amF3Y41&t=dGV4dA==&m=Q1BD&keyword=all&source_id=sk-text&ip_addr=119.153.130.111&ref_url=s&user_agent=mozila&mod=api").validate().responseJSON {
            response in
            switch response.result {
            case .success:
                
                print("Validate Successfully")
                if let json = response.data {
                    
                    do{
                        let data = try JSON(data: json)
                        
                        let status = data["status"]
                        let title = data["response"]["title"].stringValue
                        let displayURL = data["response"]["display_url"].stringValue
                        let description = data["response"]["description"].stringValue
                        let clickURL = data["response"]["clickURL"].stringValue
                        let type = data["response"]["type"].stringValue
                        let method = data["response"]["method"].stringValue
                        let bid = data["response"]["bid"].stringValue
                       // let title = data["response"]["title]
                        print("DATA PARSED: \(status)")
                        print("DATA PARSED: \(title)")
                        print("DATA PARSED: \(displayURL)")
                        print("DATA PARSED: \(description)")
                        print("DATA PARSED: \(clickURL)")
                        print("DATA PARSED: \(type)")
                        print("DATA PARSED: \(method)")
                        print("DATA PARSED: \(bid)")
                        self.newLbl.text = title
                        self.newsDetailLbl.text = description
                        self.urlBtn.setTitle(displayURL, for: .normal)
                       // self.urlLbl.text = "Go To \(displayURL)"
                       
                    }
                    catch{
                        print("JSON Error")
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    

   

}
