//
//  BannerView.swift
//  BannerWebView
//
//  Created by Amco on 8/21/20.
//  Copyright © 2020 Amco. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SafariServices
import WebKit
import Kingfisher

class BannerView: UIViewController, WKNavigationDelegate  {
    

   
    
    @IBOutlet weak var bannerImageView: UIImageView!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBAction func backBtn(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
       
       
       
        
        Alamofire.request("http://api.activemobile.com/?k=0&pid=452&sid=339&zid=1308&auth=amF3Y41&t=YmFubmVyX2NwbQ==&m=Q1BN&size=MzIweDUw&source_id=dfs&ip_addr=119.153.130.111&ref_url=s&user_agent=mozila&mod=api").validate().responseJSON {
            response in
            switch response.result {
            case .success:
                
                print("Validate Successfully")
                if let json = response.data {
                    
                    do{
                        let data = try JSON(data: json)
                        
                        let status = data["status"]
                        let title = data["response"]["title"].stringValue
                        let file = data["response"]["file"].stringValue
                        let clickURL = data["response"]["clickURL"].stringValue
                        let type = data["response"]["type"].stringValue
                        let method = data["response"]["method"].stringValue
                        let bid = data["response"]["bid"].stringValue
                       // let title = data["response"]["title]
                        print("DATA PARSED: \(status)")
                        print("DATA PARSED: \(title)")
                        print("DATA PARSED: \(file)")
                        print("DATA PARSED: \(clickURL)")
                        print("DATA PARSED: \(type)")
                        print("DATA PARSED: \(method)")
                        print("DATA PARSED: \(bid)")
                       
                       
                       
                        let imageURL = URL(string: file)
                       
                        self.bannerImageView.kf.setImage(with: imageURL, placeholder: UIImage(named: file))
                        
                        
                        
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

