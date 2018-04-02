//
//  UserJSONParser.swift
//  VideoConnect
//
//  Created by Protocol on 25/07/16.
//  Copyright © 2016 VideoConn. All rights reserved.
//

import Foundation


class UserJSONParser: VCJSONParser {
    
    func getParsedData(dataDict:NSDictionary, jsonKey:String) ->NSMutableArray {
        
        let dataDict:NSDictionary = dataDict.value(forKey: DATA_JSON_KEY) as! NSDictionary
        
        let arrays:NSArray = dataDict.value(forKey: jsonKey) as! NSArray
        
        return self.getVCUsers(allObjs: arrays)
        
    }
    
    func getVCUsers(allObjs:NSArray) ->NSMutableArray {
        
        let arr : NSMutableArray = NSMutableArray()
        for arrDict in allObjs  {
            
            let arrObj:User = User()
            arrObj.setData(fromData: arrDict as! NSDictionary)
            arr.add(arrObj)
        }
        
        return arr
    }
    
}
