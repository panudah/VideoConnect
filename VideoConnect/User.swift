//
//  User.swift
//  VideoConnect
//
//  Created by Protocol on 23/06/16.
//  Copyright © 2016 VideoConn. All rights reserved.
//

import Foundation


class User: NSObject {
    
    var userId: String = ""
    var profileImg: String = ""
    var userName : String = ""
    var countryName : String = ""
    
    
    override init() {
        super.init()
    }
    
    func setData (fromData dict: NSDictionary) {
        
        if (dict.value(forKey: "userId") != nil) {
            self.userId =  dict["userId"] as! String
        }
        
        if (dict.value(forKey: "profileImage") != nil) {
            self.profileImg =  dict["profileImage"] as! String
        }
        
        if (dict.value(forKey: "userName") != nil) {
            self.userName =  dict["userName"] as! String
        }
        
        if (dict.value(forKey: "countryName") != nil) {
            self.countryName =  dict["countryName"] as! String
        }
    }
    
    
    func setDataForVideo (fromData dict: NSDictionary) {
        
        if (dict.value(forKey: "userid") != nil) {
            self.userId =  dict["userid"] as! String
        }
        
        if (dict.value(forKey: "user_profile_img") != nil) {
            self.profileImg =  dict["user_profile_img"] as! String
        }
        
        if (dict.value(forKey: "username") != nil) {
            self.userName =  dict["username"] as! String
        }
    }
    
    func setDataForMoreVideo (fromData dict: NSDictionary) {
        
        if (dict.value(forKey: "user_Id") != nil) {
            self.userId =  dict["user_Id"] as! String
        }
        
        if (dict.value(forKey: "user_profile_image") != nil) {
            self.profileImg =  dict["user_profile_image"] as! String
        }
        
        if (dict.value(forKey: "username") != nil) {
            self.userName =  dict["username"] as! String
        }
    }


    
}
