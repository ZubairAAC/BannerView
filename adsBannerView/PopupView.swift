//
//  PopupView.swift
//  BannerWebView
//
//  Created by Amco on 8/21/20.
//  Copyright © 2020 Amco. All rights reserved.
//

import UIKit
import WebKit
import SafariServices
import Alamofire
import SwiftyJSON

class PopupView: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var myWebView: UIWebView!
    
    @IBAction func backBtn(_ sender: Any) {
   
        self.dismiss(animated: true, completion: nil)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       popUpResponse()
        
    }
    
    func popUpResponse(){
        
        Alamofire.request("http://api.activemobile.com/?k=0&pid=452&sid=339&zid=1309&auth=amF3Y41&t=cG9w&m=Q1BN&source_id=SK-REDIRECT&ip_addr=119.153.130.111&ref_url=s&user_agent=mozila&mod=api").validate().responseJSON {
            response in
            switch response.result {
            case .success:
                
                print("Validate Successfully")
                if let json = response.data {
                    
                    do{
                        let data = try JSON(data: json)
                        
                        let status = data["status"]
                        let title = data["response"]["title"].stringValue
                        let popUpURL = data["response"]["pop_url"].stringValue
                        let type = data["response"]["type"].stringValue
                        let method = data["response"]["method"].stringValue
                        let bid = data["response"]["bid"].stringValue
                       // let title = data["response"]["title]
                        print("DATA PARSED: \(status)")
                        print("DATA PARSED: \(title)")
                        print("DATA PARSED: \(type)")
                        print("DATA PARSED: \(method)")
                        print("DATA PARSED: \(bid)")
                        
                        let url = NSURL(string: popUpURL)
                        let request = URLRequest(url: url! as URL)
                        self.myWebView.loadRequest(request)
                       
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

