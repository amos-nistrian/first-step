//
//  BaseService.swift
//  FirstStep
//
//  Created by Michael J. Siderius on 3/7/16.
//  Copyright © 2016 Michael J. Siderius. All rights reserved.
//

import Foundation
import Firebase

let BASE_URL = "https://firststepsmoking.firebaseio.com/"
let FIREBASE_REF = Firebase(url: BASE_URL)

var CURRENT_USER: Firebase{
    let userID = UserDefaults.standard.value(forKey: "uid") as! String
    let currentUser = Firebase(url: "\(FIREBASE_REF)").child(byAppendingPath: "users").child(byAppendingPath: userID)
    
    return currentUser!
}
