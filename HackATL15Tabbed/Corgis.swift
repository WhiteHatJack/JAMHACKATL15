//
//  Corgis.swift
//  HackATL15Tabbed
//
//  Created by Jack Hester on 10/17/15.
//  Copyright © 2015 Jack Hester. All rights reserved.
//

import UIKit

class Corgis: UIViewController {

    @IBOutlet var webViewFirstItem: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let url = NSURL (string: "jam-app-support.azurewebsites.net")
        let requestObj = NSURLRequest(URL: url!)
        webViewFirstItem.loadRequest(requestObj);
        webViewFirstItem.allowsInlineMediaPlayback = true
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
