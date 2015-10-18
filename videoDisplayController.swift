//
//  videoDisplayController.swift
//  HackATL15Tabbed
//
//  Created by Jack Hester on 10/17/15.
//  Copyright © 2015 Jack Hester. All rights reserved.
//
///Users/JHester/Downloads/a8e78bbfe703.mp4

import UIKit
import AVFoundation
import AVKit

class videoDisplayController: UIViewController {

    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    var videoPath: NSURL?
    var videoLoaded = false
    var videoViews = videoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videoLoaded = false
        loadVideo("Users/JHester/Downloads/a8e78bbfe703.mp4")
        playVideo()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadVideo(pathTo: String) {
        videoPath = NSURL(string: pathTo)
        if (videoPath != nil) {
            player = AVPlayer(URL: videoPath!)
            if (player != nil) {
                playerLayer = AVPlayerLayer(player: player)
                playerLayer!.frame = self.view.bounds
                playerLayer!.hidden = false
                videoViews.layer.addSublayer(playerLayer!)
                self.view.addSubview(videoViews)
                videoLoaded = true
            }
        }
    }
    
    func isVideoLoaded() ->Bool {
        return videoLoaded
    }

    func playVideo() {
        if (isVideoLoaded()) {
            player!.play()
        } else {
            print("failed")
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
