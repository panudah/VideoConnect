//
//  Product.swift
//  VideoConnect
//
//  Created by Protocol on 23/06/16.
//  Copyright © 2016 VideoConn. All rights reserved.
//

import Foundation


class Product: NSObject {
    
    var productId: NSString?
    var name: NSString?
    var img: NSString?
    var flag: NSString? // Flagged
    var descr: NSString?
    var status : NSString?
    var type: NSString?
    override init() {
        super.init()
    }
    
    func setData (fromData dict: NSDictionary) {
        
        if (dict.value(forKey: "productId") != nil) {
            self.productId =  dict["productId"] as? NSString
        }
        
        if (dict.value(forKey: "name") != nil) {
            self.name =  dict["name"] as? NSString
        }
        
        if (dict.value(forKey: "image") != nil) {
            self.img =  dict["image"] as? NSString
        }
        
        if (dict.value(forKey: "type") != nil) {
            self.type =  dict["type"] as? NSString
        }
        
        if (dict.value(forKey: "status") != nil) {
            self.status =  dict["status"] as? NSString
        }
        
        if (dict.value(forKey: "product_flag") != nil) {
            self.flag =  dict["product_flag"] as? NSString
        }
        
        if (dict.value(forKey: "description") != nil) {
            self.descr =  dict["description"] as? NSString
        }
        
    }
    
}
