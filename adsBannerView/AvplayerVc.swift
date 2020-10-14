//
//  AvplayerVc.swift
//  FinalBannerView
//
//  Created by Amco on 9/11/20.
//  Copyright © 2020 Amco. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import Alamofire
import SwiftyJSON
import MediaPlayer
import MobileCoreServices


class AvplayerVc: AVPlayerViewController, AVPlayerViewControllerDelegate {

    //MARK:- New Video Player
    let avplayerController = AVPlayerViewController()
    
    var myurl = ""
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       

    }
    
    override func viewDidAppear(_ animated: Bool) {

if let url = URL(string: "https://www.youtube.com/watch?v=yxH9RtUkLFc"){
          let playerItem = AVPlayerItem(url: url)
          let player = AVPlayer(playerItem: playerItem)
          let playerLayer = AVPlayerLayer(player: player)
          playerLayer.frame=CGRect(x: 10, y: 10, width: 300, height: 300)
          self.view.layer.addSublayer(playerLayer)
     
   }

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
 
    func playVideo(url: NSURL){
        let player = AVPlayer(url: url as URL)
        let playerController = AVPlayerViewController()

        playerController.player = player
        self.addChild(playerController)
        self.view.addSubview(playerController.view)
        playerController.view.frame = self.view.frame

        player.play()
    }
    
    func addResponse(){
        
        Alamofire.request("http://ads.activemobile.com/vpaid/video_tracking_events.php?solo=1&data=MjAyMC0wOS0yMT0wMzo0NTo0MTM2NDAwMDAtfC1CVlM3bUhUeWlZQ2hGdEJmOVllQjIwMjAtMDktMjE9MDM6NDU6NDExODg0MzQ1MjgtfC1bUkFORE9NX0lEXSxkLDE5MCw0MDksdmlkZW8sNDA0Nzc0OCw4MCwxLDQ1Miw0NTIsNDUyXzQwOV9kLDEwMy4xMDQuMjEzLjI0NiwsTEcgIE5leHVzIDUsdGFibGV0LCwsQW5kcm9pZCxMRyAgTmV4dXMgNSwsTEcsLCwsLDIwMjAtMDktMjEsMDM6NDg6NDEsMDMsMSwxLDAsVU5LTk9XTi18LVlFUy0xLTEtMS0xLTEtMC0wLTAtMC0wLTAtMC0wLTAtfC1odHRwOi8vd3d3Lmdvb2dsZS5jb20tfC1odHRwOi8vYWRtaW4uYWN0aXZlbW9iaWxlLmNvbS92aWRlby80NTIvNDUyXzE1NzAwMjRfMzY5NTUyMDE1Ni18LTMyMC18LTI0MC18LVZJREVP").validate().responseJSON {
            response in
            switch response.result {
            case .success:
                print("Validate Successfully")
                if let json = response.data{
                    do{
                        let result = try JSON(data: json)
                        let data = result["data"].dictionaryValue
                        let skipbleEvent = data["skipable_event"]?.stringValue
                        let startEvent = data["start_event"]?.stringValue
                        let firstQuartile = data["first_quartile_event"]?.stringValue
                        let midPoint = data["mid_point_event"]?.stringValue
                        let thirdQuartile = data["third_quartile_event"]?.stringValue
                        let impression = data["impression_event"]?.stringValue
                        let fileUrl = data["click_url"]?.stringValue
                        let clickEvent = data["click_event"]?.stringValue
                        let file = data["files"]?.arrayValue
                        
//                        let quoteBalanceStr = rows[0]["quote"]["balance"].stringValue
//                        let quoteBalance = Double(quoteBalanceStr.trimmingCharacters(in: CharacterSet(charactersIn: "01234567890.").inverted))
//                        let baseBalanceStr = rows[0]["base"]["balance"].stringValue
//                        let baseBalance = Double(baseBalanceStr.trimmingCharacters(in: CharacterSet(charactersIn: "01234567890.").inverted))
//                        let ramBalanceEosKB = (quoteBalance! / baseBalance!) * 1024
                        
                        
                        let url = file![0]["url"].stringValue
                        let bitrate = file![1]["bitrate"].stringValue
                        let width = file![2]["width"].stringValue
                        let height = file![3]["height"].stringValue
                        let type = file![4]["type"].stringValue
                        let myURL = URL(string: url)!
                    print(url)
                        //MARK:- Set value of URL to empty string
                        self.myurl = url
                        
                        
                        
                    }
                    catch{
                        print("JSON error")
                    }
                }
            case .failure(let error):
                print(error)
                
            }
            
            
        }
        
    }
    

    

}


