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

class FirstViewController: UIViewController {
    //buttons
    
    //likes
    var firstPostLiked: UIButton?
    
    @IBAction func firstPostLiked(sender: UIButton) {
        firstPostLiked = sender
        if sender.titleLabel!.textColor == UIColor.lightGrayColor() {
            sender.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        }
        else{
            sender.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
        }
    }
    //up & downvote
    var firstPostUpvoted: UIButton?
    @IBAction func firstPostUpvoted(sender: UIButton) {
        firstPostUpvoted = sender
        print(sender)
        if sender.titleLabel!.textColor == UIColor.lightGrayColor() {
            sender.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
            /*if (firstPostDownvoted != nil) {
                firstPostDownvoted!.setTitleColor(UIColor.lightGrayColor(), forState:UIControlState.Normal)
            }*/
        }
        else{
            sender.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
        }

    }
    
    var firstPostDownvoted: UIButton?
    @IBAction func firstPostDownvoted(sender: UIButton) {
        firstPostDownvoted = sender
        
        if sender.titleLabel!.textColor == UIColor.lightGrayColor() {
            sender.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
            /*if (firstPostUpvoted != nil) {
                firstPostUpvoted!.setTitleColor(UIColor.lightGrayColor(), forState:UIControlState.Normal)
                
            }*/
        }
        else{
            sender.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
        }
    }
    
    
    //end buttons
    
    var player = [AVQueuePlayer?] (count: 3, repeatedValue:nil)
    var playerLayer = [AVPlayerLayer?] (count: 3, repeatedValue:nil)
    var videoPath: NSURL?
    var videoLoaded = false
    var videoViews = videoView()
    var playerPlaying: AVQueuePlayer?
    var lastItem: AVPlayerItem?
    var isLastItem = false
    var nextI = 0
    var timerCount = 0
    var timer = NSTimer()
    override func viewDidLoad() {
        super.viewDidLoad()
        timerCount = 0
        //
        //
        videoLoaded = false
        loadVideo("https://mediasvcsxvz6tqdbsk5g.blob.core.windows.net/asset-1f49105d-1500-80c4-e055-f1e57524c717/corgi%204.mp4?sv=2012-02-12&sr=c&si=be4618cf-867d-4522-a92f-09d08e3437b0&sig=B4HhR6G4QD62t1kSvNKQJqvGo8RiAAXgLEBRZEbZpLU%3D&st=2015-10-17T23%3A18%3A49Z&se=2115-09-23T23%3A18%3A49Z")
        //loadVideo("http://hackatl15videofeed.streaming.mediaservices.windows.net/220c658f-d7b6-406b-848f-644f283b83ef/corgi%201.ism/Manifest")
        //loadVideo("https://mediasvcsxvz6tqdbsk5g.blob.core.windows.net/asset-1f49105d-1500-80c4-e055-f1e57524c717/corgi%204.mp4?sv=2012-02-12&sr=c&si=be4618cf-867d-4522-a92f-09d08e3437b0&sig=B4HhR6G4QD62t1kSvNKQJqvGo8RiAAXgLEBRZEbZpLU%3D&st=2015-10-17T23%3A18%3A49Z&se=2115-09-23T23%3A18%3A49Z")
        addVideo("https://mediasvcsxvz6tqdbsk5g.blob.core.windows.net/asset-1f49105d-1500-80c4-a26b-f1e57524c11f/corgi%203.mp4?sv=2012-02-12&sr=c&si=f2984d3c-4cc6-445e-9aa0-7442f04288dc&sig=x5wO5jiDTcpRRMs3ObJsduDT0h%2FPZ8XiL7VCoh8WjtM%3D&st=2015-10-17T23%3A18%3A57Z&se=2115-09-23T23%3A18%3A57Z")
        addVideo("https://mediasvcsxvz6tqdbsk5g.blob.core.windows.net/asset-1f49105d-1500-80c4-a26b-f1e57524c11f/corgi%203.mp4?sv=2012-02-12&sr=c&si=f2984d3c-4cc6-445e-9aa0-7442f04288dc&sig=x5wO5jiDTcpRRMs3ObJsduDT0h%2FPZ8XiL7VCoh8WjtM%3D&st=2015-10-17T23%3A18%3A57Z&se=2115-09-23T23%3A18%3A57Z")
        playVideo(0)
        //playVideo()
        addVideo("https://mediasvcsxvz6tqdbsk5g.blob.core.windows.net/asset-1f49105d-1500-80c4-a26b-f1e57524c11f/corgi%203.mp4?sv=2012-02-12&sr=c&si=f2984d3c-4cc6-445e-9aa0-7442f04288dc&sig=x5wO5jiDTcpRRMs3ObJsduDT0h%2FPZ8XiL7VCoh8WjtM%3D&st=2015-10-17T23%3A18%3A57Z&se=2115-09-23T23%3A18%3A57Z")
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target:self, selector: "updateEverySec", userInfo: nil, repeats: true)
        //addVideo("http://hackatl15videofeed.streaming.mediaservices.windows.net/220c658f-d7b6-406b-848f-644f283b83ef/corgi%201.ism/Manifest")
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateEverySec() {
        //timerCount++
        if (lastItem != nil) {
            if (isLastItem) {
                if (playerPlaying!.items() == []) {
                    
                    if (nextI < 2) {
                        nextI++;
                    } else {
                        nextI = 0;
                    }
                    playVideo(nextI)
                }
            }
        }
    }
    
    func loadVideo(pathTo: String) {
        for i in 0...2 {
            let videoPath = NSURL(string: pathTo)
            if (videoPath != nil) {
                player[i] = AVQueuePlayer(URL: videoPath!)
                if (player[i] != nil) {
                    /*
                    var point = CGPoint(x: 5.0 * Double(i), y: 5.0 * Double(i))
                    var size = CGSize(width: 10.0 * Double(i + 1), height: 10.0 * Double(i + 1))
                    var frame = CGRect(origin: point, size: size)
                    */
                    playerLayer[i] = AVPlayerLayer(player: player[i])
                    playerLayer[i]!.hidden = false
                    playerLayer[i]!.frame = CGRect(x:37.5, y:10.0+200.0 * Double(i), width:300.0, height:200.0)
                    //videoViews.layer.addSublayer(playerLayer[i]!)
                    //self.view.addSubview(videoViews)
                    self.view.layer.addSublayer(playerLayer[i]!)
                    videoLoaded = true
                }
            }
            
        }
    }
    
    func addVideo(pathTo: String) {
        for i in 0...2 {
            let videoPath = NSURL(string: pathTo)
            if (videoPath != nil) {
                var newItem: AVPlayerItem?
                newItem = AVPlayerItem(URL: videoPath!)
                if (newItem != nil) {
                    player[i]!.insertItem(newItem!, afterItem: nil)
                }
            }
            
        }
    }
    func isVideoLoaded() ->Bool {
        return videoLoaded
    }
    
    func playVideo(i: Int) {
        //for i in 0...2 {
            if (isVideoLoaded()) {
                player[i]!.play()
                if (player[i]!.items() != []) {
                    lastItem = player[i]!.items()[player[i]!.items().count-1]
                    isLastItem = true
                    playerPlaying = player[i]
                } else {
                    isLastItem = false
                }
            } else {
                print("failed")
            }
            
        //}
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
