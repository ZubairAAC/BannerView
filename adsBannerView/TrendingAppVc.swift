//
//  TrendingAppVc.swift
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
import AVKit
import AVFoundation
import MediaPlayer
import Foundation


class TrendingAppVc: UIViewController, WKNavigationDelegate, AVPlayerViewControllerDelegate {
    
    @IBOutlet weak var TitleView: UIView!
    @IBOutlet weak var midView: UIView!
    @IBOutlet weak var detailView: UIView!
    
    @IBOutlet weak var mediaPlayer: UIView!
    @IBOutlet weak var myWebView: WKWebView!
    
    @IBOutlet weak var infoLbl: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    //var player : AVPlayer?
     var player :AVPlayer?
    var playerItem: AVPlayerItem?
    var avPlayerLayer: AVPlayerLayer?
    
    override func viewDidLoad(){
            super.viewDidLoad()
        
       
        
     
//           if let player = GPVideoPlayer.initialize(with: self.mediaPlayer.bounds) {
//                    player.isToShowPlaybackControls = true
//
//                    self.mediaPlayer.addSubview(player)
//
//                    let url1 = URL(string: "http://static.videokart.ir/clip/100/480.mp4")!
//                   // let videoFilePath = Bundle.main.path(forResource: "video", ofType: "mp4")
//                    //let url2 = URL(fileURLWithPath: videoFilePath!)
//
//            player.loadVideo(with: url1)
//                    //player.loadVideos(with: [url1, url2])
//                    player.isToShowPlaybackControls = true
//                    player.isMuted = false
//                    player.playVideo()
//                }
            
//        mediaView.isHidden = true
//        let newUrl = URL(string: "http://admin.activemobile.com/video/452/452_1570024_3695520156_1024.webm")
//        let request = URLRequest(url: newUrl!)
//        myWebView.load(request)
//        view.addSubview(myWebView)
        
       
        styling()
        fontStyling()
            
        
     
        }
            
           
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    
   
    
    func playVideo(url: URL) {
        let player = AVPlayer(url: url)
      

        let vc = AVPlayerViewController()
        vc.player = player

        self.present(vc, animated: true) { vc.player?.play() }
    }
    
    
  
    
    
//Refresh Page to load more Offers Powered by Activemobile.com
    func fontStyling(){
       
        
let countryTex = NSMutableAttributedString(string: "Refresh Page to load more Offers Powered by Activemobile.com")
countryTex.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 43, length: 17))
infoLbl.attributedText = countryTex


    }
 
    func styling(){
        detailView.layer.borderColor = UIColor.black.cgColor
        detailView.layer.borderWidth = 0.5
    }
    
}

