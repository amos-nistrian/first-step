//
//  CreateAccountViewController.swift
//  FirstStep
//
//  Created by Michael J. Siderius on 3/7/16.
//  Copyright © 2016 Michael J. Siderius. All rights reserved.
//

import UIKit
import Firebase



class CreateAccountViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField:UITextField) -> Bool{
        textField.resignFirstResponder()
        
        return true
        
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

    @IBAction func cancelAction(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func createAccountAction(_ sender: AnyObject) {
      
        let email = self.emailTextField.text
        let password = self.passwordTextField.text
        
        if email != "" && password != ""
        {
            FIREBASE_REF?.createUser(email,password:password, withValueCompletionBlock: {(error,authData) -> Void in
                
                if error == nil
                {
                    FIREBASE_REF?.authUser(email,password:password,withCompletionBlock: {(error, authData) -> Void in
                        
                        if error == nil
                        {
                            UserDefaults.standard.setValue(authData?.uid,forKey:"uid")
       
                            print("account created")
                            
                            
    
                            GlobalVariables.sharedManager.emailKey = (authData?.uid)!
//.//////////////////////
                            
                            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                            
                            let vc: UINavigationController = storyboard.instantiateViewController(withIdentifier: "sideViewController") as! UINavigationController
                            
                            self.present(vc, animated: true, completion: nil)
                         //////////////////////////////////

                        }
                        else{
                            print("Error")
                        }
                        
                    })
                        
                }
                else
                {
                    
                    print("Error")
                }
            })
        
        }
        else{
            let alert = UIAlertController(title: "Error", message: "Enter Email and Password", preferredStyle: .alert)
            let action = UIAlertAction(title:"OK", style:  .default, handler:nil)
            
            alert.addAction(action)
            self.present(alert, animated:true, completion: nil)
            
            
        }
        
        
    }
}









