//
//  Shop.swift
//  VideoConnect
//
//  Created by Protocol on 27/06/16.
//  Copyright © 2016 VideoConn. All rights reserved.
//

import UIKit

class Shop: NSObject {
    
    var shopId: NSString?
    var name: NSString?
    var img: NSString?
    var headerimg: NSString?
    var shopURL: NSString = ""
    var telephone: NSString = ""
    var mobile: NSString = ""
    var email : NSString = ""
    var address: NSString = ""
    var country : NSString = ""
    var categoryName : NSString?

    
    var products : NSMutableArray?
    
    override init() {
        super.init()
    }
    
    func setData (fromData dict: NSDictionary) {
        
        if (dict.value(forKey: "shopId") != nil) {
            self.shopId =  dict["shopId"] as? NSString
        }
        
        if (dict.value(forKey: "name") != nil) {
            self.name =  dict["name"] as? NSString
        }
        
        if (dict.value(forKey: "categoryName") != nil) {
            self.categoryName =  dict["categoryName"] as? NSString
        }
        
        if (dict.value(forKey: "image") != nil) {
            self.img =  dict["image"] as? NSString
        }
        
        if (dict.value(forKey: "headerImage") != nil) {
            self.headerimg =  dict["headerImage"] as? NSString
        }
        
        if (dict.value(forKey: "url") != nil) {
            self.shopURL =  (dict["url"] as? NSString)!
        }
        
        if (dict.value(forKey: "telePhone") != nil) {
            self.telephone =  (dict["telePhone"] as? NSString)!
        }
        
        if (dict.value(forKey: "mobile") != nil) {
            self.mobile =  (dict["mobile"] as? NSString)!
        }
        
        if (dict.value(forKey: "email") != nil) {
            self.email =  (dict["email"] as? NSString)!
        }
        
        if (dict.value(forKey: "address") != nil) {
            self.address =  (dict["address"] as? NSString)!
        }
        
        if (dict.value(forKey: "countryName") != nil) {
            self.country =  (dict["countryName"] as? NSString)!
        }
        self.products = NSMutableArray()

        if (dict.value(forKey: "shopProduct") != nil) {
            let prodArrays : NSArray =  (dict["shopProduct"] as? NSArray)!
            for arrDict in prodArrays  {
                
                let arrObj:Product = Product()
                arrObj.setData(fromData: arrDict as! NSDictionary)
                products!.add(arrObj)
                
            }

        }

        
    }


}
