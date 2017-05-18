//
//  globalname.swift
//  FirstStep
//
//  Created by Michael J. Siderius on 3/17/16.
//  Copyright © 2016 Michael J. Siderius. All rights reserved.
//

import Foundation
class globalname {
    
    // These are the properties you can store in your singleton
     var myName: String = "john"
    
    
    
    // Here is how you would get to it without there being a global collision of variables.
    // , or in other words, it is a globally accessable parameter that is specific to the
    // class.
    class var share: globalname {
        struct Static {
            static let instance = globalname()
        }
        return Static.instance
    }
}