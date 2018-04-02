//
//  APIManager.swift
//  VideoConnect
//
//  Created by Protocol on 02/08/16.
//  Copyright © 2016 Protocol. All rights reserved.
//

import UIKit
import Alamofire

class APIManager: NSObject {
    
    typealias APICompletion = (_ response: AnyObject?, _ error: String?) -> Void
    
//    static func sendGetRequest(url url:String, parameter: NSDictionary, withCompletion completion: APICompletion) {
//        Alamofire.request(.GET, url, parameters: parameter as? [String : AnyObject]).responseJSON { (response: Response<AnyObject, NSError>) in
//            self.renderResponse(url:url, parameters:parameter, response: response.result.value, error:response.result.error, completion: completion)
//        }
//    }
//
//    static func sendPostRequest(urlSuffix: String, parameter: NSDictionary, withCompletion completion: APICompletion) {
//        let strURL: String = (String(format: HOST_URL, PATH) + urlSuffix).stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
//        Alamofire.request(.POST, strURL, parameters: parameter as? [String : AnyObject], encoding: .JSON).responseJSON { (response: Response<AnyObject, NSError>) in
//            self.renderResponse(url:strURL, parameters:parameter, response: response.result.value, error:response.result.error, completion: completion)
//        }
//    }
//
//    static func sendPostRequest(parameter parameter: NSDictionary, withMultipart multipart:NSDictionary, withCompletion completion: APICompletion) {
//        let strURL: String = String(format: HOST_URL, PATH).stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
//
//        Alamofire.upload(.POST, strURL, multipartFormData: { (data:MultipartFormData) in
//            for optKey in parameter.allKeys {
//                let key: String = optKey as! String
//                let value: AnyObject = parameter.objectForKey(key)!
//                data.appendBodyPart(data: value.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!, name: key)
//            }
//
//            if multipart.allKeys.count > 0 {
//                let url: NSURL = NSURL(fileURLWithPath: multipart.valueForKey("path") as! String)
//                let key: String = multipart.valueForKey("key") as! String
//                let name: String = multipart.valueForKey("name") as! String
//                data.appendBodyPart(fileURL: url, name: key, fileName: name, mimeType: "image/png")
//            }
//        }) { (encodingResult:Manager.MultipartFormDataEncodingResult) in
//            switch encodingResult {
//            case .Success(let upload, _, _ ):
//                upload.responseJSON { (response: Response<AnyObject, NSError>) in
//                    self.renderResponse(url:strURL, parameters:parameter, response:response.result.value , error:response.result.error, completion: completion)
//                }
//            case .Failure(let encodingError):
//                print(encodingError)
//                completion(response: nil, error: "Error occured. Please try again.")
//            }
//        }
//    }
    
    private static func renderResponse(url url:String, parameters:NSDictionary, response:AnyObject!, error:NSError!, completion:APICompletion) {
        if response != nil {
            let jsonObject: NSDictionary = response as! NSDictionary
            NSLog("\n\nRequest URL - %@\n\nRequest Parameters - %@\n\nResponse - %@\n\n\n", url, parameters, jsonObject)
            if jsonObject.value(forKey: "status") as! Int == 200 {
                completion(jsonObject, nil)
            } else {
                completion(nil, jsonObject.value(forKey: "info") as? String)
            }
        } else if error != nil {
            NSLog("\n\nRequest URL - %@\n\nRequest Parameters - %@\n\nResponse - %@\n\n\n", url, parameters, error.localizedDescription)
            completion(String(error!.code) as AnyObject, error!.localizedDescription)
        }
    }
}
