//
//  ViewController.swift
//  VideoConnect
//trrtfff,
//  Created by apple on 29/03/18.
//  Copyright © 2018 Tanay Bhattacharjee. All rights reserved.
//

import UIKit



class ViewController: SWRevealViewController {
    
    var httpRequest:HTTPRequest!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*let dict:NSDictionary = NSDictionary()
         
         HTTPRequest().fetchContents(HO_URL, dictionary:dict, tag: 0,requestType:"GET", timeoutInterval:60.0)*/
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func didFinishWithError(error error: NSError?, response dict: NSDictionary, object httpRequest: HTTPRequest) {
        if(error != nil){
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
