//
//  Channel.swift
//  VideoConnect
//
//  Created by Protocol on 23/06/16.
//  Copyright © 2016 VideoConn. All rights reserved.
//

import Foundation


class Channel: NSObject {
    
    var channelId: String = ""
    var title: String = ""
    var channelImg : String = ""
    var createdDate : String = ""
    var subscribers : String = ""
    var favourites : String = ""
    var dislikeCount : String = ""
    var likeCount : String = ""
    
    override init() {
        super.init()
    }
    
    func setData (fromData dict: NSDictionary) {
        
        if (dict.value(forKey: "channelId") != nil) {
            self.channelId = (dict["channelId"] as? String)!
        }
        
        if (dict.value(forKey: "title") != nil) {
            self.title =  (dict["title"] as? String)!
        }
        
        if (dict.value(forKey: "image") != nil) {
            self.channelImg =  (dict["image"] as? String)!
        }
        
        if (dict.value(forKey: "createdDate") != nil) {
            self.createdDate = (dict["createdDate"] as? String)!
        }
        
        if (dict.value(forKey: "subscribers") != nil) {
            self.subscribers =  (dict["subscribers"] as? String)!
        }
        
        if (dict.value(forKey: "favourites") != nil) {
            self.favourites =  (dict["favourites"] as? String)!
        }

        
        if (dict.value(forKey: "likeCount") != nil) {
            self.likeCount = (dict["likeCount"] as? String)!
        }
        
        if (dict.value(forKey: "dislikeCount") != nil) {
            self.dislikeCount = (dict["dislikeCount"] as? String)!
        }
    }
}
