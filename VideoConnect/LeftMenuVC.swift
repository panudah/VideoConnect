//
//  LeftMenuVC.swift
//  VideoConnect
//
//  Created by Protocol on 25/06/16.
//  Copyright © 2016 VideoConn. All rights reserved.
//

import UIKit

class LeftMenuVC: UIViewController,WebServiceDelegate,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsBeforeLogin.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // let cell: MenuTableViewCell? = tableView.dequeueReusableCell(withIdentifier: String(describing: MenuTableViewCell()), for: indexPath as IndexPath) as? MenuTableViewCell
        
        let cell = self.zoneTableView.dequeueReusableCell(withIdentifier: "ball") as! MenuTableViewCell
        cell.layoutIfNeeded()
        cell.backgroundColor = UIColor.clear
             //   var dataSource : Array =  (tableView == self.menuTableView) ?(NSUserDefaults.IsUserLoggedIn()) ?itemsAfterLogin:itemsBeforeLogin:itemsZones
        cell.lblTitle.text = itemsBeforeLogin[indexPath.row]
        //
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    
    
  
   
    
    
    @IBOutlet weak var menuTableView : UITableView!
    @IBOutlet weak var zoneTableView : UITableView!
    @IBOutlet weak var zoneView : UIView!
    
    var itemsBeforeLogin: [String] = ["Login", "Register", "Zones" ,"About us","Privacy policy","Terms of use", "Business plan", "Videoconnectt fees"]
 //   var itemsAfterLogin: [String] = ["Zones" ,"Profile","Chat","Video","Shop","Jobs", "About us","Privacy policy","Terms of use", "Business plan", "Videoconnectt fees","Logout"]
 //   var itemsZones: [String] = ["Connectt Friends", "Connectt Passions", "Connectt Hearts" ,"Connectt Trades","VC Timeline"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //   self.zoneTableView.dataSource = self
     //   self.zoneTableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
 
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.zoneView.alpha = 0
        zoneTableView?.reloadData()
    }
    
    // MARK: -  UITableViewDataSource
    
  //  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     //   return (tableView == self.menuTableView) ?(NSUserDefaults.IsUserLoggedIn()) ?//itemsAfterLogin.count:itemsBeforeLogin.count:itemsZones.count
      //  return 5
    //}
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell: MenuTableViewCell? = tableView.dequeueReusableCell(withIdentifier: String(describing: MenuTableViewCell()), for: indexPath as IndexPath) as? MenuTableViewCell
//        cell?.layoutIfNeeded()
//        cell?.backgroundColor = UIColor.clear
//     //   var dataSource : Array =  (tableView == self.menuTableView) ?(NSUserDefaults.IsUserLoggedIn()) ?itemsAfterLogin:itemsBeforeLogin:itemsZones
//     //   cell?.lblTitle.text = dataSource[indexPath.row]
//
//        cell?.backgroundColor = UIColor.clear
//        return cell!
//    }
    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return UIScreen.main.size.width * ((UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad) ?(90.0/1024.0):(40.0 / 320.0))
//    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    
    // MARK: -  UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        let registerVC = self.storyboard!.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
        let navController = UINavigationController(rootViewController: registerVC)
        
        //navController.setViewControllers([secondViewController!], animated:true)
        
      //  self.revealViewController().pushFrontViewController(navController, animated: true)
        
        
        self.revealViewController().present(navController, animated: true, completion: nil)

       // if (tableView == self.menuTableView) {
       //     let strOption: String = (NSUserDefaults.IsUserLoggedIn()) ?itemsAfterLogin[indexPath.row]:itemsBeforeLogin[indexPath.row]
            
              /*  switch strOption {
                case "Login":
                    let loginVC = self.storyboard!.instantiateViewControllerWithIdentifier("Login") as! LoginVC
                    self.revealViewController().setFrontViewPosition(FrontViewPosition.Left, animated: true)
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(0.25 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
                        self.revealViewController().frontViewController.presentViewController(loginVC, animated: true, completion:nil)
                    }
                    break
                case "Register":
                    let registerVC = self.storyboard!.instantiateViewControllerWithIdentifier("RegisterVC") as! RegisterVC
                    self.revealViewController().setFrontViewPosition(FrontViewPosition.Left, animated: true)
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(0.25 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
                        self.revealViewController().frontViewController.presentViewController(registerVC, animated: true, completion:nil)
                    }
                    break
                    
                case "Profile":
                    
                    let profileVC = self.storyboard?.instantiateViewControllerWithIdentifier("ProfileVC") as! ProfileVC
                    (self.revealViewController().frontViewController as! UINavigationController).pushViewController(profileVC, animated: true)
                    self.revealViewController().setFrontViewPosition(.Left, animated: true)
                    
                    break
                    
                case "Jobs":
                    
                    let profileVC = self.storyboard?.instantiateViewControllerWithIdentifier("ViewJobOpeningVC") as! ViewJobOpeningVC
                    (self.revealViewController().frontViewController as! UINavigationController).pushViewController(profileVC, animated: true)
                    self.revealViewController().setFrontViewPosition(.Left, animated: true)
                    
                    break
                    
                case "Zones":
                    UIView.animateWithDuration(0.3) {
                        self.zoneView.alpha = 1.0
                    }
                    break
                case "Logout" :
                    callLogoutWS()
                    break
                case "About us":
                    let webVC = self.storyboard!.instantiateViewControllerWithIdentifier("WebVC") as! WebVC
                    webVC.displayTitle = "About us"
                    webVC.displayURL = "http://videoconnectt.net/mvc/content/about.html"
                    self.revealViewController().frontViewController.presentViewController(webVC, animated: true, completion:nil)
                    break
                case "Privacy policy":
                    let webVC = self.storyboard!.instantiateViewControllerWithIdentifier("WebVC") as! WebVC
                    webVC.displayTitle = "Privacy policy"
                    webVC.displayURL = "http://videoconnectt.net/mvc/content/privacypage.html"
                    self.revealViewController().frontViewController.presentViewController(webVC, animated: true, completion:nil)
                    break
                case "Terms of use":
                    let webVC = self.storyboard!.instantiateViewControllerWithIdentifier("WebVC") as! WebVC
                    webVC.displayTitle = "Terms of use"
                    webVC.displayURL = "http://videoconnectt.net/mvc/content/termofuse.html"
                    self.revealViewController().frontViewController.presentViewController(webVC, animated: true, completion:nil)
                    break
                case "Business plan":
                    let webVC = self.storyboard!.instantiateViewControllerWithIdentifier("WebVC") as! WebVC
                    webVC.displayTitle = "Business plan"
                    webVC.displayURL = "http://videoconnectt.net/mvc/content/businessplan.html"
                    self.revealViewController().frontViewController.presentViewController(webVC, animated: true, completion:nil)
                    break
                case "Videoconnectt fees":
                    let webVC = self.storyboard!.instantiateViewControllerWithIdentifier("WebVC") as! WebVC
                    webVC.displayTitle = "Videoconnectt fees"
                    webVC.displayURL = "http://videoconnectt.net/mvc/content/feesstructure.html"
                    self.revealViewController().frontViewController.presentViewController(webVC, animated: true, completion:nil)
                    break
                default:
                    break
                }
        } else {
            switch itemsZones[indexPath.row] {
            case "Connectt Friends":
                
                break
            case "Connectt Passions":
                let passionVC = self.storyboard?.instantiateViewControllerWithIdentifier("PassionVC") as! PassionVC
                (self.revealViewController().frontViewController as! UINavigationController).pushViewController(passionVC, animated: true)
                self.revealViewController().setFrontViewPosition(.Left, animated: true)
                break
            case "Connectt Hearts":
                
                break
            case "Connectt Trades":
                let tradesVC = self.storyboard?.instantiateViewControllerWithIdentifier("TradesVC") as! TradesVC
                (self.revealViewController().frontViewController as! UINavigationController).pushViewController(tradesVC, animated: true)
                self.revealViewController().setFrontViewPosition(.Left, animated: true)
                break
            case "VC Timeline":
                
                break
            default:
                break
            }
        }*/
      //  }
    }
    
//    @IBAction func backAction(sender: AnyObject) {
//        UIView.animate(withDuration: 0.3) {
//            self.zoneView.alpha = 0
//        }
//    }
    
//    func callLogoutWS() {
//        if let logonInfo: Dictionary<String,AnyObject> =  NSUserDefaults.retriveLoggedInDetails() {
//
//            ProgressManager.showWithStatus(nil, onView: AppDelegate.delegate()?.window)
//
//            let httpRequest :HTTPRequest = HTTPRequest()
//            httpRequest.delegate = self
//
//            let dict : NSDictionary = ["sessionId":logonInfo["sessionId"]!]
//
//            httpRequest.fetchContents(String(format:HOST_URL,PATH) + LOGOUT_PATH, dictionary: dict, tag: 0,requestType:"POST", timeoutInterval:30.0)
//        }
//    }
    
    // MARK: - WebServiceDelegate
    
    func didFinishWithError(error: NSError?, response dict: NSDictionary, object httpRequest: HTTPRequest) {
//        dispatch_async(dispatch_get_main_queue()){
//            ProgressManager.dismiss()
//            if (error == nil) {
//                if dict["status"] as! Int == 200 { // Logout Sucess
//                    NSUserDefaults.removeObjectOfKey(LOGIN_SAVE_KEY)
//                    ProgressManager.showSuccessWithStatus("Logged out successfully.", onView: AppDelegate.delegate()?.window, completion: {
//                        self.menuTableView?.reloadData()
//
//                        let nc = NSNotificationCenter.defaultCenter()
//                        nc.postNotificationName("LoginLogoutRefresh",
//                            object: nil,
//                            userInfo:nil)
//                    })
//                } else {
//                    ProgressManager.dismiss()
//                    if dict.objectForKey("info") != nil {
//                        ProgressManager.showErrorWithStatus(dict["info"] as! String, onView: AppDelegate.delegate()?.window)
//                    }
//                }
//            } else {
//                ProgressManager.dismiss()
//                if dict.objectForKey("info") != nil {
//                    ProgressManager.showErrorWithStatus(dict["info"] as! String, onView: AppDelegate.delegate()?.window)
//                }
//            }
//        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}
