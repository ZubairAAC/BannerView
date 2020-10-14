//
//  AvplayerVcNew.swift
//  FinalBannerView
//
//  Created by Amco on 9/30/20.
//  Copyright © 2020 Amco. All rights reserved.
//

import UIKit
import WebKit
import AVKit
import Foundation
import Alamofire
import SwiftyJSON
import SafariServices

class AvplayerVcNew: UIViewController, AVPlayerViewControllerDelegate, WKNavigationDelegate, UIWebViewDelegate {

     let webV = WKWebView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        addVideo()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
//        guard let url = URL(string: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")else {return}
//               let player = AVPlayer(url: url)
//        let playerController = AVPlayerViewController()
//               playerController.player = player
//               playerController.allowsPictureInPicturePlayback = true
//               playerController.player?.play()
//               self.present(playerController, animated: false, completion: nil)
    }
    

  
    
    func addVideo(){
        Alamofire.request("http://video.activemobile.com/?k=0&pid=452&sid=190&zid=409&auth=amF3Y41&t=dmlkZW8=&m=Q1BN&source_id=d&video=https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4&width=320&height=240&type=api&VAST=1").validate().responseJSON {
            response in
            switch response.result{
            case .success:
                
                print("Validate Successfully")
                if let json = response.data {
                    
                    do{
                        let data = try JSON(data: json)
                        
                        let status = data["status"]
                        let videoUrl = data["video_url"].stringValue
                        let width = data["ad_width"].stringValue
                        let height = data["ad_height"].stringValue
                        let clickUrl = data["clickUrl"].stringValue
                        let trackingLink = data["tracking_links"].stringValue
                       // let title = data["response"]["title]
                        
                        //MARK:- tap gesture for video player
                        
                      
                        
                        
                        
                        
                        
                        
                        guard let url = URL(string: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")else {return}
                        let player = AVPlayer(url: url)
                        let playerController = AVPlayerViewController()
                        playerController.player = player
                        playerController.allowsPictureInPicturePlayback = true
                        playerController.player?.play()
                        self.present(playerController, animated: false, completion: nil)
                        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissClick))
                        playerController.view.addGestureRecognizer(tapGestureRecognizer)
                        
                        
                        
                        
                       
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
    
    @objc func dismissClick(){
         
       
        if UIWindow.key != nil {
             let vc = UIStoryboard(name: "Main", bundle: Bundle.main)
                   let newVc = vc.instantiateViewController(withIdentifier: "BannerView") as? BannerView
                  present(newVc!, animated: false, completion: nil)
        }
        
      //  self.presentingViewController?.dismiss(animated: true, completion: nil)
//        let vc = UIStoryboard(name: "Main", bundle: Bundle.main)
//        let newVc = vc.instantiateViewController(withIdentifier: "BannerView") as? BannerView
//        let top = UIApplication.shared.keyWindow?.rootViewController
//        top!.present(newVc!, animated: false, completion: nil)
        
        
//        webV.frame  = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//        webV.load(NSURLRequest(url: NSURL(string: "https://www.apple.com")! as URL) as URLRequest)
//        self.view.addSubview(webV)
    }

  

}
extension AVPlayerViewController{

    open override func viewDidLoad() {
        
     

        let btn = UIButton(type: .roundedRect)
        btn.backgroundColor = UIColor.lightGray
        btn.setTitle("SKIP AD", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.layer.cornerRadius = 5.0
        btn.frame = CGRect(x: 200, y: 600, width: 150, height: 40)
        btn.addTarget(self, action: #selector(self.pressButton(button:)), for: .touchUpInside)
        btn.isUserInteractionEnabled = true
        btn.isEnabled = true
        btn.clipsToBounds = true

        self.contentOverlayView?.addSubview((btn as? UIButton)!)
        self.showsPlaybackControls = false

        btn.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        btn.isHidden = false
        btn.addTarget(self, action: #selector(self.pressButton), for: .touchUpInside)
                }

    }


    @objc func pressButton(button: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main)
                let newVc = vc.instantiateViewController(withIdentifier: "BannerVC") as? BannerVC
                self.present(newVc!, animated: false, completion: nil)
    }

}

extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}
