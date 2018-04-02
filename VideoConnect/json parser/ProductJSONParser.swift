//
//  ProductJSONParser.swift
//  VideoConnect
//
//  Created by Protocol on 19/07/16.
//  Copyright © 2016 VideoConn. All rights reserved.
//

import Foundation


class ProductJSONParser: VCJSONParser {
    
    func getParsedData(dataDict:NSDictionary, jsonKey:String) ->NSMutableArray {
        
        if (dataDict.value(forKey: DATA_JSON_KEY) as? NSDictionary) != nil {
            let dataDict:NSDictionary = dataDict.value(forKey: DATA_JSON_KEY) as! NSDictionary
            
            let arrays:NSArray = dataDict.value(forKey: jsonKey) as! NSArray
            
            return self.getVCProducts(allObjs: arrays)
        }
        
        return NSMutableArray()
        
        
    }
    
    func getVCProducts(allObjs:NSArray) ->NSMutableArray {
        
        let arr : NSMutableArray = NSMutableArray()
        for arrDict in allObjs  {
            
            let arrObj:Product = Product()
            arrObj.setData(fromData: arrDict as! NSDictionary)
            arr.add(arrObj)
            
        }
        
        return arr
    }
    
}
