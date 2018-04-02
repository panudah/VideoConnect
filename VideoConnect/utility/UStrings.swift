//
//  UStrings.swift
//  VideoConnect
//
//  Created by Protocol on 11/07/16.
//  Copyright © 2016 VideoConn. All rights reserved.
//

import Foundation

extension NSString {
    
    func setFullServerPath() {
    }
}

extension String {
    var boolValue: Bool {
        get {
            return NSString(string: self).boolValue
        }
        set {
            self = (newValue == true) ?"true":"false"
        }
    }
    
    var intValue: Int {
        get {
            return NSString(string: self).integerValue
        }
        set {
            self = String(newValue)
        }
    }
    
    var integerValue: NSInteger {
        get {
            return NSString(string: self).integerValue
        }
        set {
            self = String(newValue)
        }
    }
    
    var floatValue: Float {
        get {
            return NSString(string: self).floatValue
        }
        set {
            self = String(newValue)
        }
    }
}
