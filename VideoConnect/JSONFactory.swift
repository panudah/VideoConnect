//
//  JSONFactory.swift
//  VideoConnect
//
//  Created by Protocol on 25/06/16.
//  Copyright © 2016 VideoConn. All rights reserved.
//

import UIKit

class JSONFactory: NSObject {
    
    
    func getParser(parserType:NSInteger) ->VCJSONParser {
        
        switch parserType {
        case 1:
            return HomeVCParser()
//        case 2:
//        //    return VideoJSONParser()
//        case 3:
//        //    return ProductJSONParser()
//        case 4:
//         //   return ShopJSONParser()
//        case 5:
//         //   return UserJSONParser()
//        case 6:
//          //  return ChannelJSONParser()
       default:
            return VCJSONParser()
            
        }
        
        
    }
    

}
