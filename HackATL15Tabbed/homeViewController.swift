//
//  homeViewController.swift
//  HackATL15Tabbed
//
//  Created by Jack Hester on 10/18/15.
//  Copyright © 2015 Jack Hester. All rights reserved.
//

import UIKit

class homeViewController: UIViewController {
    
    var firstPostUpvoted: UIButton?
    @IBAction func firstPostUpvoted(sender: UIButton) {
        firstPostUpvoted = sender as! UIButton
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
    
    var firstPostLiked: UIButton?
    @IBAction func firstPostLiked(sender: UIButton) {
        firstPostLiked = sender as! UIButton
        if sender.titleLabel!.textColor == UIColor.lightGrayColor() {
            sender.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

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
