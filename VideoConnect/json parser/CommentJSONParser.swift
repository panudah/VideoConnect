//
//  CommentJSONParser.swift
//  VideoConnect
//
//  Created by Protocol on 9/5/16.
//  Copyright © 2016 VideoConn. All rights reserved.
//

import UIKit

class CommentJSONParser: VCJSONParser {
    func getParsedData(dataDict:NSDictionary, jsonKey:String) ->NSMutableArray {
        
        if (dataDict.value(forKey: DATA_JSON_KEY) as? NSDictionary) != nil {
            let dataDict:NSDictionary = dataDict.value(forKey: DATA_JSON_KEY) as! NSDictionary
            let arrays:NSArray = dataDict.value(forKey: jsonKey) as! NSArray
            return self.getVCChannels(allObjs: arrays)
        }
        return NSMutableArray()
        
    }
    
    func getVCChannels(allObjs:NSArray) ->NSMutableArray {
        
        let arr : NSMutableArray = NSMutableArray()
        for arrDict in allObjs  {
            
            let arrObj:Channel = Channel()
            arrObj.setData(fromData: arrDict as! NSDictionary)
            arr.add(arrObj)
        }
        return arr
    }
}
