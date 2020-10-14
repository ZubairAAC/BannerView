//
//  NewVideoPlayer.swift
//  FinalBannerView
//
//  Created by Amco on 9/29/20.
//  Copyright © 2020 Amco. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation



class NewVideoPlayer: AVPlayerViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()

      
        
    let url = URL(string: "http://admin.activemobile.com/video/452/452_1570024_3695520156_512.webm")

        if let movieURL = url {
         
            self.player = AVPlayer(url: movieURL)
            AVPlayer.load()
                   }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

