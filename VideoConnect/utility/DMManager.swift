//
//  DMManager.swift
//  VideoConnect
//
//  Created by My Mac on 6/21/17.
//  Copyright © 2017 VideoConn. All rights reserved.
//

import UIKit
import Alamofire

protocol DMManagerDelegate {
//    func DMManagerfetchDataSuccess(wrapper : DMManager,dicsResponse : AnyObject)
//    func DMManagerfetchDataFail(wrapper : DMManager,error : NSError)
}

class DMManager: NSObject {
    
    var delegate:DMManagerDelegate? = nil
    typealias APICompletion = (_ response: AnyObject?, _ error: String?) -> Void
    
    // MARK:- requestWithparamdictParamPostMethod
    
//    func requestWithparamdictParamPostMethod(url : String ,dicsParams : [String: AnyObject])
//    {
        //if !self.checkInternetConnection()
        // {
        
        
        // self.delegate?.DMManagerfetchDataFail("Checkinternetconnection", error: error);
        // return
        //  }
        
        //   let strURL: String = (String(format: HOST_URL, PATH) + urlSuffix).stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        // .validate(contentType: ["application/json"])
//        Alamofire.request(.POST,url, parameters: dicsParams, encoding:.JSON).responseString{ response in
//           // debugPrint(response)
//            }.responseJSON
//            {
//                response in switch response.result
//                {
//                case .Success(let JSON):
//                    //   print("Success with JSON: \(JSON)")
//                    //converting json into NSDictionary
//
//                    let response = JSON
//                   // print(response)
//
//                    self.delegate?.DMManagerfetchDataSuccess(self, dicsResponse: response)
//
//                case .Failure(let error):
//                    print("Request failed with error: \(error)")
//                    self.delegate?.DMManagerfetchDataFail(self, error: response.result.error! as NSError);
//                }
      //  }
        
     /*   Alamofire.request(.POST, url, parameters: dicsParams)
            .responseJSON { response in
                
                print(dicsParams)
                if((response.result.error) != nil)
                {
                    print("Sucees But Error: \(String(response.result.error))")
                    //                    AppHelper.showAlertWithTitle("", description1: "Please try again some internet problem")
                    if response.result.error?.code == -1009 {
                        //self.delegate?.DMManagerfetchDataFail(self, error: response.result.error! as NSError);
                    }
                }
            }
            .responseString(completionHandler: { (string) in
                
            })
            .responseJSON { response in
                
                // print("Response JSON: \n \(response.result.value!)")
                if((response.result.error) == nil)
                {
                    if let JSON = response.result.value {
                        //var mydict = NSDictionary()
                        //  mydict = JSON as! NSDictionary
                        
                        if (self.delegate != nil){
                            print("Delegate")
                            self.delegate?.DMManagerfetchDataSuccess(self, dicsResponse: JSON)
                        }
                    }
                    else
                    {
                        //AppHelper.showAlert("Alert", message: "Please try again.")
                        print("response not converted to JSON")
                    }
                }
                else
                {
                    if (self.delegate != nil){
                        self.delegate?.DMManagerfetchDataFail(self, error: response.result.error! as NSError);
                    }
                }
        }
        
        
    }   */
    
    
    /*    Alamofire.request(url, method: .post, parameters: dicsParams, encoding: URLEncoding.default).responseString
     { response in
     print(dicsParams)
     if((response.result.error) != nil)
     {
     print("Sucees But Error: \(String(describing: response.result.error))")
     //                    AppHelper.showAlertWithTitle("", description1: "Please try again some internet problem")
     }
     }
     .responseString(completionHandler: { (string) in
     
     })
     .responseJSON { response in
     print("Response JSON: \n \(String(describing: response.result.value))")
     if((response.result.error) == nil)
     {
     if let JSON = response.result.value
     {
     var mydict = NSDictionary()
     mydict = JSON as! NSDictionary
     
     if (self.delegate != nil){
     self.delegate?.HttpWrapperfetchDataSuccess(wrapper: self, dicsResponse: mydict.mutableCopy() as! NSMutableDictionary)
     }
     }
     else
     {
     print("response not converted to JSON")
     //                        SharedUtility.showAlert("Alert", message: "Please try again.")
     }
     }
     else
     {
     if (self.delegate != nil){
     self.delegate?.HttpWrapperfetchDataFail(wrapper: self, error: response.result.error! as NSError);
     }
     }
     }*/
   // }
}
