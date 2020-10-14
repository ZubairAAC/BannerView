//
//  AppOfferWal.swift
//  FinalBannerView
//
//  Created by Amco on 9/8/20.
//  Copyright © 2020 Amco. All rights reserved.
//

import UIKit
import SafariServices
import WebKit
import AVKit
import AVFoundation

class AppOfferWal: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var myWebView: UIWebView!
    
    
    @IBOutlet weak var backBtn: UIButton!
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

      let myUrl = URL(string: "http://apps.activemobile.com/?k=0&pid=452&sid=190&zid=699&auth=amF3Y41&m=Q1BJ&t=YXBwd2FsbA==&ds=gai")
               let request = URLRequest(url: myUrl!)
               myWebView.loadRequest(request)
        
        if request.url?.absoluteString == "" {
            
        }
        print(request)
        print(myWebView.loadRequest(request))
    }
    

}

