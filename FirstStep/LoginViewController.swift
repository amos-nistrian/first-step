//
//  LoginViewController.swift
//  FirstStep
//
//  Created by Michael J. Siderius on 3/7/16.
//  Copyright © 2016 Michael J. Siderius. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController,UITextFieldDelegate {
    
    let globalEmail = GlobalVariables.sharedManager.emailKey


    @IBOutlet weak var invalidLogin: UILabel!

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logoutButton: UIButton!
    let firebase = Firebase(url:"https://firststepsmoking.firebaseio.com/")
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    //    firebase.observeEventType(.Value, withBlock: { snapshot in
      //          print(snapshot.value)
            
        //    }, withCancelBlock: { error in
          //      print(error.description)
        //})
        
        // Do any additional setup after loading 
        //the view.
    }
    
    func textFieldShouldReturn(_ textField:UITextField) -> Bool{
        textField.resignFirstResponder()
        
        return true
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.invalidLogin.isHidden = true
        
        if UserDefaults.standard.value(forKey: "uid") != nil && CURRENT_USER.authData != nil{
            
        }
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

    @IBAction func logoutAction(_ sender: AnyObject) {
        
        CURRENT_USER.unauth()
        
        UserDefaults.standard.setValue(nil,forKey:"uid")
        self.logoutButton.isHidden = true
        
        
        
    }
    @IBAction func loginAction(_ sender: AnyObject) {
        let email = self.emailTextField.text
        let password = self.passwordTextField.text
        

        
        if email != "" && password != "" {
            FIREBASE_REF?.authUser(email, password: password, withCompletionBlock: {(error, authData) -> Void in
                if error == nil{
                    UserDefaults.standard.setValue(authData?.uid, forKey: "uid")
                    
                    let userID = authData
                    
                    let aString: String = String(describing: userID)
                    let newString = aString.replacingOccurrences(of: "AuthData ", with: "")
                    
                    let urlpath = (format: "https://firststepsmoking.firebaseio.com/"+"\(newString)") as NSString
                    print(urlpath)
                    
                    var arr = [String]()
                    
                    let ref = Firebase(url: urlpath as String)
                    
                    ref?.observeSingleEvent(of: .value, with: { snapshot in

                        let enumerator = snapshot?.children
                        while let rest = enumerator?.nextObject() as? FDataSnapshot {
        
                            //print(rest.value)
                            let data = String(describing: rest.value)
                            arr.append(data)

                        }
                
                        var count = 0
                        for element in arr {
                            
                            if count == 0{
                                 GlobalVariables.sharedManager.dateStarted = element
                             //   print(GlobalVariables.sharedManager.dateStarted)
                                
                              
                            }
                            else if count == 1{
                                GlobalVariables.sharedManager.firstName1 = element
                                 print("1")
                                    print(GlobalVariables.sharedManager.firstName1)
                                
                                
                                  globalname.share.myName = GlobalVariables.sharedManager.firstName1
                                 print("2")
                                     print(globalname.share.myName)
                                
                               //  print(GlobalVariables.sharedManager.firstName1)
                                
                            }
                            else if count == 2{
                                GlobalVariables.sharedManager.lastName = element
                          //      print(GlobalVariables.sharedManager.lastName)
                                
                            }
                            else if count == 3{
                                GlobalVariables.sharedManager.lastSmokeDate = element
                          //      print(GlobalVariables.sharedManager.lastSmokeDate)
                                
                            }
                            else if count == 4{
                                GlobalVariables.sharedManager.milestone = element
                           //     print(GlobalVariables.sharedManager.milestone)
                                
                            }
                            else if count == 5{
                                GlobalVariables.sharedManager.photoBase = element
                           //     print(GlobalVariables.sharedManager.photoBase)
                                
                            }
                            else if count == 6{
                                GlobalVariables.sharedManager.quitDate = element
                          //      print(GlobalVariables.sharedManager.quitDate)
                                
                            }
                            
                            //print(count)
                            //print(element)
                            count += 1
                        }
                    })
                    
                    
                    
                    //// === CHANGE VIEW === ////

                    
                    
                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    
                    let vc: UINavigationController = storyboard.instantiateViewController(withIdentifier: "segueLogin") as! UINavigationController
                    
                    self.present(vc, animated: true, completion: nil)
                    
                               
                    
                    print("logged In:)")
           
                
                }else{
                    self.invalidLogin.isHidden = false
                    print(error as Any)
                }
                
                
            })
        }
        else{
            
           
            
            let alert = UIAlertController(title: "Error", message: "Enter Email and Password", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(action)
            self.present(alert, animated:true, completion:nil)
            
            
        }
    
    }
}
