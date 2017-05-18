//
//  ViewController.swift
//  FirebaseDemo
//
//  Created by Ravi Shankar on 19/11/15.
//  Copyright © 2015 Ravi Shankar. All rights reserved.
//

import UIKit
import Firebase

class AddUserViewController: UIViewController,UITextFieldDelegate {
    // FOR DATE PICKER

    
    @IBOutlet weak var datePicker1: UIDatePicker!
    
    @IBOutlet weak var datePickedd: UILabel!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
   
    // GLOBALS LOCAL
    let globalEmail = GlobalVariables.sharedManager.emailKey
    let firebase = Firebase(url:"https://firststepsmoking.firebaseio.com/")
    var imagePicker: UIImagePickerController = UIImagePickerController()
    
    
    @IBAction func datePickerA(_ sender: AnyObject) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let strDate = dateFormatter.string(from: datePicker1.date)
        self.datePickedd.text=strDate
    
    
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        photoImageView.layer.cornerRadius = photoImageView.frame.size.width/2
        
        photoImageView.clipsToBounds = true
        
        
    }
    
    func textFieldShouldReturn(_ textField:UITextField) -> Bool{
        textField.resignFirstResponder()
        
        return true
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //-- GET CURRENT DATE AS STRING -- //
    
    var shortDate: String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter.string(from: Date())
 
    }
    @IBAction func save(_ sender: AnyObject) {

        let firstname = nameTextField.text
        let lastname = lastNameField.text
        let quitDate = datePickedd.text

        
        var data: Data = Data()

        if let image = photoImageView.image {
           data = UIImageJPEGRepresentation(image,0.1)!
        }
        
        let base64String = data.base64EncodedString(options: NSData.Base64EncodingOptions.lineLength64Characters)

        /// DATE CALCULATIONS///

        
        /// END DATE CALCULATIONS  ///
        
        let user: NSDictionary =
        ["firstName":firstname!,
            "lastName":lastname!,
            "photoBase64":base64String,
            "milestone": 0,
            "dateStarted":shortDate,
            "quitDate": quitDate!,
            "lastSmokeDate":shortDate]
        
        //add firebase child node
        let profile = firebase?.ref.child(byAppendingPath: globalEmail)
        
        // Write data to Firebase
        profile?.setValue(user)
      
      //  navigationController?.popViewControllerAnimated(true)
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc: UINavigationController = storyboard.instantiateViewController(withIdentifier: "start") as! UINavigationController
        
        self.present(vc, animated: true, completion: nil)
        
    }
    

 
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
}

extension AddUserViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK:- UIImagePickerControllerDelegate methods
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        photoImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK:- Add Picture
    
    @IBAction func addPicture(_ sender: AnyObject) {
        
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)) {
            imagePicker =  UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            
            present(imagePicker, animated: true, completion: nil)
        } else {
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            present(imagePicker, animated: true, completion:nil)
        }
    }
}
