//
//  videoCaptureControllerViewController.swift
//  HackATL15Tabbed
//
//  Created by Jack Hester on 10/17/15.
//  Copyright © 2015 Jack Hester. All rights reserved.
//
// ======== Spread Your Jam ========

import UIKit

import MobileCoreServices
import AssetsLibrary

class videoCaptureControllerViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    let controller = UIImagePickerController()
    let assetsLibrary = ALAssetsLibrary()
    
    //"make new jam" button (take a video)
    @IBAction func takeVideo(sender: AnyObject) {
        
        // 1 Check if project runs on a device with camera available
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            
        // 2 Present UIImagePickerController to take video
        controller.sourceType = .Camera
        controller.mediaTypes = [kUTTypeMovie as! String]
        controller.delegate = self
        controller.videoMaximumDuration = 60.0
            
        presentViewController(controller, animated: true, completion: nil)
        }
        else {
            print("Camera is not available")
        }
        
    }

    //"view your jam" button (view video/photo library)
    @IBAction func viewLibrary(sender: AnyObject) {
        // Display Photo Library
        controller.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        controller.mediaTypes = [kUTTypeMovie as String]
        controller.delegate = self
        
        presentViewController(controller, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //////////////////
    func imagePickerControllerimagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject: AnyObject]) {
        
        // 1
        let mediaType:AnyObject? = info[UIImagePickerControllerMediaType]
        
        if let type:AnyObject = mediaType {
            if type is String {
                let stringType = type as! String
                if stringType == kUTTypeMovie as! String {
                    let urlOfVideo = info[UIImagePickerControllerMediaURL] as? NSURL
                    if let url = urlOfVideo {
                        // 2
                        assetsLibrary.writeVideoAtPathToSavedPhotosAlbum(url,
                            completionBlock: {(url: NSURL!, error: NSError!) in
                                if let theError = error{
                                    print("Error saving video = \(theError)")
                                }
                                else {
                                    print("no errors happened")
                                }
                        })
                    }
                }
                
            }
        }
        
        // 3
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
///////////////////////////////////////////

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
