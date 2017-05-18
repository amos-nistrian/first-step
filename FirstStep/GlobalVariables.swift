//
//  GlobalVariables.swift
//  test
//
//  Created by Michael J. Siderius on 3/13/16.
//  Copyright © 2016 Michael J. Siderius. All rights reserved.
//
import Foundation

class GlobalVariables {
    
    // These are the properties you can store in your singleton
    var emailKey: String = ""
    
    var dateStarted : String =  ""
    var firstName1 : String =  ""
    var lastName : String =  ""
    var lastSmokeDate : String =  ""
    var milestone : String =  ""
    var photoBase : String =  ""
    var quitDate : String =  ""
    

    
    // Here is how you would get to it without there being a global collision of variables.
    // , or in other words, it is a globally accessable parameter that is specific to the
    // class.
    class var sharedManager: GlobalVariables {
        struct Static {
            static let instance = GlobalVariables()
        }
        return Static.instance
    }
}