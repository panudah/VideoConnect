//
//  Utilities.swift
//  VideoConnect
//
//  Created by Protocol on 25/06/16.
//  Copyright © 2016 VideoConn. All rights reserved.
//

import UIKit


func generateRandomData() -> [[UIColor]] {
    let numberOfRows = 20
    let numberOfItemsPerRow = 15
    
    return (0..<numberOfRows).map { _ in
        return (0..<numberOfItemsPerRow).map { _ in UIColor.randomColor() }
    }
}

extension UIColor {
    class func randomColor() -> UIColor {
        
        let hue = CGFloat(arc4random() % 100) / 100
        let saturation = CGFloat(arc4random() % 100) / 100
        let brightness = CGFloat(arc4random() % 100) / 100
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
    }
}

extension UserDefaults {
    
    class func saveDataForKey(key:String, objectToSaved:AnyObject) {
        
        let defaults:UserDefaults = UserDefaults.standard
        defaults.set(objectToSaved, forKey:key)
        defaults.synchronize()
        
    }
    
    class func retriveDataForKey(key:String)-> AnyObject {
        
        let defaults:UserDefaults = UserDefaults.standard
        if let userDict = defaults.object(forKey: key) {
            return userDict as AnyObject
        }
        else {
            return [String: String]() as AnyObject
        }
        
        
    }
    
    class func removeObjectOfKey(key:String) {
        
        let defaults:UserDefaults = UserDefaults.standard
        if defaults.object(forKey: key) != nil {
            defaults.removeObject(forKey: key)
        }
        
    }

    
    class func retriveLoggedInUserId()-> String {
        
        let dict =  self.retriveDataForKey(key: LOGIN_SAVE_KEY)
       
        if let userID = dict["userId"] as? String {
             return userID
        }
        else {
            return ""
        }
    }
    
    
    class func retriveLoggedInDetails()-> Dictionary<String,AnyObject> {
        
        
        if let info = self.retriveDataForKey(key: LOGIN_SAVE_KEY) as? Dictionary<String,AnyObject>{
            return info
        }
        else {
            return Dictionary<String,AnyObject>()
        }
    }
    
    
    class func IsUserLoggedIn()-> Bool {
        
        let  loggedUser =  self.retriveLoggedInUserId() as String
        
        if  loggedUser.characters.count > 0 {
             return true
        }
        
        return false
       
    }


}



extension Int {
    var degreesToRadians : CGFloat {
        return CGFloat(self) * CGFloat(M_PI) / 180.0
    }
}
