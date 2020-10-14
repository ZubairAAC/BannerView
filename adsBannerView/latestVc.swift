//
//  latestVc.swift
//  FinalBannerView
//
//  Created by Amco on 9/25/20.
//  Copyright © 2020 Amco. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import MediaPlayer
import SafariServices
import WebKit

class latestVc: UIViewController, AVPlayerViewControllerDelegate, WKNavigationDelegate {

    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var viewone: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        guard let videoURL = URL(string: "https://www.youtube.com/watch?v=TmdSnCw-Mjw") else
//        {return}
//
//        let request = NSURLRequest(url: videoURL)
//        self.myWebView.load(request as URLRequest)
//        myWebView.allowsBackForwardNavigationGestures = true
//        let player = AVPlayer(url: videoURL!)
//        let playerLayer = AVPlayerLayer(player: player)
//        playerLayer.frame = self.view.bounds
//        self.view.layer.addSublayer(playerLayer)
//        player.play()

       videoPlayer()
        
    }
    

    func videoPlayer(){
        let videoURL = URL(string: "https://www.youtube.com/watch?v=TmdSnCw-Mjw")
        let player = AVPlayer(url: videoURL!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
    }
    

}

