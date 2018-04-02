//
//  Video.swift
//  VideoConnect
//
//  Created by Protocol on 23/06/16.
//  Copyright © 2016 VideoConn. All rights reserved.
//

import Foundation

class Video: NSObject {
  
    
    
    
    
    var videoId: String = ""
    var type: String = ""
    var playUrl: String = ""
    var title: String = "Test Title : Best Friends"
    var descr: String = "Test Description : Best Friends"
    var views: String = ""
    var fav : String = ""
    var thumbImg  : String = ""
    var zoneId  : String = ""
    
    var shopCount: String = "0"
    var channelCount: String = "0"
    
    var dating: String = ""
    
var user:User = User()
    
    var comment: String = ""
    var flgged: String = ""
    var dislike: String = ""
    var like : String = ""
    var categoryId : String = ""
    var timeCreated : String = ""
    var subCategoryId1 : String = ""
    var subCategoryId2 : String = ""
    var categoryName : String = ""
    var comments: NSMutableArray = NSMutableArray()
    
    var dataDictionary: NSDictionary = NSDictionary()
    var moreDataDictionary: NSDictionary = NSDictionary()
    
    override init() {
        super.init()
    }
    
    func setData (fromData dict: NSDictionary) {
        self.dataDictionary = dict
        
        if (dict.value(forKey: "videoId") != nil) {
            self.videoId =  dict["videoId"] as! String
        }
        
        if (dict.value(forKey: "videoType") != nil) {
            self.type =  dict["videoType"] as! String
        }
        
        if (dict.value(forKey: "categoryName") != nil) {
            self.categoryName =  dict["categoryName"] as! String
        }
        
        if (dict.value(forKey: "categoryId") != nil) {
            self.categoryId =  (dict["categoryId"] as? String)!
        }
        if (dict.value(forKey: "zoneId") != nil) {
            self.zoneId =  (dict["zoneId"] as? String)!
        }
        
        if (dict.value(forKey: "timeCreated") != nil) {
            self.timeCreated =  dict["timeCreated"] as! String
        }
        
        if (dict.value(forKey: "subCategoryId1") != nil) {
            self.subCategoryId1 =  (dict["subCategoryId1"] as? String)!
        }
        
        if (dict.value(forKey: "dating") != nil) {
            self.dating =  (dict["dating"] as? String)!
        }
        
        if (dict.value(forKey: "subCategoryId2") != nil) {
            self.subCategoryId2 =  (dict["subCategoryId2"] as? String)!
        }
        
        if (dict.value(forKey: "shopCount") != nil) {
            self.shopCount =  (dict["shopCount"] as? String)!
        }
        
        if (dict.value(forKey: "channelCount") != nil) {
            self.channelCount =  (dict["channelCount"] as? String)!
        }
        
        if (dict.value(forKey: "playurl") != nil) {
            self.playUrl =  dict["playurl"] as! String
        }
        
        if (dict.value(forKey: "title") != nil) {
            self.title =  dict["title"] as! String
        }
        
        if (dict.value(forKey: "description") != nil) {
            self.descr =  dict["description"] as! String
        }
        
        if (dict.value(forKey: "videoThumbImg") != nil) {
            self.thumbImg =  dict["videoThumbImg"] as! String
        }
        
     //   user = user

        if (dict.value(forKey: "user") != nil) {
            user.setData(fromData:dict.object(forKey: "user") as! NSDictionary)
        }
        
        if (dict.value(forKey: "viewsCount") != nil) {
            self.views =  dict["viewsCount"] as! String
        }
        
        if (dict.value(forKey: "favouritesCount") != nil) {
            self.fav =  dict["favouritesCount"] as! String
        }
        
        if (dict.value(forKey: "commentsCount") != nil) {
            self.comment =  dict["commentsCount"] as! String
        }
        
        
        if (dict.value(forKey: "flgged") != nil) {
            self.flgged =  dict["flgged"] as! String
        }
        
        if (dict.value(forKey: "dislikeCount") != nil) {
            self.dislike =  dict["dislikeCount"] as! String
        }
        
        if (dict.value(forKey: "likeCount") != nil) {
            self.like =  dict["likeCount"] as! String
        }
        
        
//        if NSString(string: comment).intValue > 0 {
//            if (dict.object(forKey: "comments") != nil) {
//                for comm in dict.object(forKey: "comments") as! NSArray {
//                    let commentObj:Comment = Comment(dict: comm as! NSDictionary)
//                    comments.addObject(commentObj)
//
//                }
//            }
//        }
    }
    
    
    func setDataForMoreVideo (fromData dict: NSDictionary) {
        self.moreDataDictionary = dict
        
        if (dict.value(forKey: "video_Id") != nil) {
            self.videoId =  dict["video_Id"] as! String
        }
        
        if (dict.value(forKey: "video_type") != nil) {
            self.type =  dict["video_type"] as! String
        }
        
        if (dict.value(forKey: "video_play_url") != nil) {
            self.playUrl =  dict["video_play_url"] as! String
        }
        
        if (dict.value(forKey: "title") != nil) {
            self.title =  dict["title"] as! String
        }
        
        if (dict.value(forKey: "description") != nil) {
            self.descr =  dict["description"] as! String
        }
        
        if (dict.value(forKey: "video_thumb_img") != nil) {
            self.thumbImg =  dict["video_thumb_img"] as! String
        }
        
        if (dict.value(forKey: "dating") != nil) {
            self.dating =  dict["dating"] as! String
        }
        
     //   user.setDataForMoreVideo(fromData:dict )
        
        if (dict.value(forKey: "views") != nil) {
            self.views =  dict["views"] as! String
        }
        
        if (dict.value(forKey: "favourites") != nil) {
            self.fav =  dict["favourites"] as! String
        }
        
        if (dict.value(forKey: "comment") != nil) {
            self.comment =  dict["comment"] as! String
        }
        
        
        if (dict.value(forKey: "flgged") != nil) {
            self.flgged =  dict["flgged"] as! String
        }
        
        if (dict.value(forKey: "dislike") != nil) {
            self.dislike =  dict["dislike"] as! String
        }
        
        if (dict.value(forKey: "like") != nil) {
            self.like =  dict["like"] as! String
        }
    }
    
    func copyWithZone(zone: NSZone) -> AnyObject {
        let video: Video = Video()
        if self.dataDictionary.allKeys.count > 0 {
            video.setData(fromData: self.dataDictionary)
        } else {
            video.setDataForMoreVideo(fromData: self.moreDataDictionary)
        }
        
        return video
    }
}
