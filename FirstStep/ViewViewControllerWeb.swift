//
//  ViewViewControllerWeb.swift
//  FirstStep
//
//  Created by Michael J. Siderius on 3/17/16.
//  Copyright © 2016 Michael J. Siderius. All rights reserved.
//

import UIKit

class ViewViewControllerWeb: UIViewController {

    @IBOutlet weak var Webview: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://m.reddit.com/r/StopSmoking")
        let request = URLRequest(url : url!)
        Webview.loadRequest(request)
        

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
