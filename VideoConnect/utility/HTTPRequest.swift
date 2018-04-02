//
//  HTTPRequest.swift
//  VideoConnect
//
//  Created by Protocol on 22/06/16.
//  Copyright © 2016 VideoConn. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
protocol WebServiceDelegate: NSObjectProtocol{
    func didFinishWithError(error error: NSError?, response dict: NSDictionary, object httpRequest: HTTPRequest)
}


class HTTPRequest:NSObject {
    
    var url: NSURL!
    var data: NSMutableData!
    weak var delegate: WebServiceDelegate?
    var tag: NSInteger
    var connection: NSURLConnection!
    var isFinish:Bool = true
    override init(){
        self.url = nil
        self.tag = -1
        self.data = NSMutableData()
        super.init()
    }
    
    init(url:NSURL){
        self.url = url
        self.tag = -1
        super.init()
    }
    
    
    init(aDelegate: WebServiceDelegate , url:NSURL){
        self.url = url
        self.tag = -1
        self.delegate = aDelegate
        super.init()
    }

    
    func fetchContents(hostURL:NSString ,dictionary:NSDictionary, tag:NSInteger , requestType:NSString ,timeoutInterval:Double)
    {
        
        self.tag = tag
        self.url = NSURL(string: hostURL as String)!
        
        
        print("URL: \(hostURL), Request: \(dictionary)")
          let parameters = ["requestFrom": "mobile", "requestType": "new,most,featured","start":"0","limit":"5","userId":"1"]
       //  let parameters = ["requestFrom":"mobile","requestType":"newProduct","start":"0","limit":"5","userId":"1"]

      //  let session = URLSession.shared
        let config = URLSessionConfiguration.default
        let session1 = URLSession(configuration: config)
     //   let assumedDict: NSDictionary! = dictionary
        Alamofire.request("http://videoconnectt.net/mvc/webservice/", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
            
            .responseJSON { response in
                //debugPrint(response.data)
                
                switch(response.result){
                case .success(_):
                    let result = response.result
                    
                    let json = result.value as! NSDictionary
                    
                    // print("----------\(json)")
                    var dic = NSDictionary()
                    
                    dic = json["data"] as! NSDictionary
                    
                    
                    // self.headers = ary_data["featured"] as! NSArray
                    print("fgfgfg \(dic)")
                    self.delegate?.didFinishWithError(error:nil, response:json, object: self)

                    
                    // self.headers = dic["featured"] as! NSArray
                    
                 //   print("the ball \(self.headers)")
                    //  self.tblHome.reloadData()
                    //                    let succ =  json["success"] as! Int
                    //                    // print(succ)
                    //                    if succ == 1
                    //                    {
                    //                    }
                    //                    else
                    //                    {
                    //
                    //
                    //
                    //                    }
                    
                    break
                    
                case .failure(_):
                    print("Network Error")
                    //    SVProgressHUD.dismiss()
                    //AppManager().AlertUser("", message: "Check Your Internet Cinnection", vc: self)
                    break
                    
                }
        }
        
        
        
        
        
        
        
       //let request = NSMutableURLRequest(url: self.url as URL)
  /*      var request =  URLRequest(url: self.url as URL)
        request.httpMethod = requestType as String
    request.cachePolicy = URLRequest.CachePolicy.reloadIgnoringCacheData
        
        
        
        request.timeoutInterval = timeoutInterval
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if requestType == "POST"  {
            
            if let variableName = assumedDict{
                
                //let dataDict: NSDictionary = ["data": variableName]
                let requestData:NSData = try! JSONSerialization.data(withJSONObject: variableName, options: JSONSerialization.WritingOptions.prettyPrinted) as NSData
               // request.httpBodyhttpBody = requestData as Data
            }
        }
        
   
    
        let task = session1.dataTask(with: request, completionHandler: { (data, response, error) in
 
            guard let _:NSData = data as NSData?, let _:URLResponse = response, error == nil else {
                print("error")
                self.isFinish = true

                let dataDict: NSDictionary = NSDictionary()
                self.delegate?.didFinishWithError(error: error as! NSError, response:dataDict, object: self)

                return
            }

            self.isFinish = true


            let error: NSError? = nil
//
            do {


                let json: NSDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary

                NSLog("response %@", json)


                //if json["status"] as! Int == 200 {

                self.delegate?.didFinishWithError(error: error as! NSError, response: json, object: self)
              //  }

             //   else {

               //     self.delegate?.didFinishWithError(error: error, response: json, object: self)

               // }

            }
            catch{

                let error = NSError(domain: "domain", code: -1, userInfo: [NSLocalizedDescriptionKey : "Server response failed.", NSLocalizedFailureReasonErrorKey: "Server response failed."])

                self.delegate?.didFinishWithError(error: error, response: NSDictionary(), object: self)
            }


       })

        task.resume()

        }*/
    
    }

}




/*func getOfflineJson() ->NSDictionary {
    
    
   }*/
