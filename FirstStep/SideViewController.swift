//
//  SideViewController.swift
//  FirstStep
//
//  Created by Michael J. Siderius on 3/13/16.
//  Copyright © 2016 Michael J. Siderius. All rights reserved.
//

import UIKit
import Firebase

class SideViewController: UIViewController {

    
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstName: UITextField!
    
    
    let firebase = Firebase(url:"https://firststepsmoking.firebaseio.com/")
    
    

    
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
