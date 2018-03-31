//
//  HomeVCParser.swift
//  VideoConnect
//
//  Created by Protocol on 25/06/16.
//  Copyright © 2016 VideoConn. All rights reserved.
//

import UIKit

class HomeVCParser: VCJSONParser {
    
    func getParsedData(dataDict:NSDictionary) ->NSMutableDictionary {
        
        let dataDict:NSDictionary = dataDict.value(forKey: DATA_JSON_KEY) as! NSDictionary
        let returnDict : NSMutableDictionary = NSMutableDictionary()
        
        for key in dataDict.keyEnumerator() {
            
            let arrays:NSArray = dataDict.value(forKey: key as! String) as! NSArray
            switch key as! String {
            case NEW_JSON_KEY,MOST_JSON_KEY,FEATURED_JSON_KEY:
                returnDict.setValue(self.getVCVideos(allObjs: arrays), forKey: key as! String)
            default:
                return returnDict
            }
        }
        
        return returnDict
        
    }
    
    func getVCVideos(allObjs:NSArray) ->NSMutableArray {
        
        let arr : NSMutableArray = NSMutableArray()
        for arrDict in allObjs  {
            let arrObj: Video = Video()
            arrObj.setData(fromData: arrDict as! NSDictionary)
            arr.add(arrObj)
            
        }
        
        return arr
    }

}
