//
//  HomeVC.swift
//  VideoConnect
//
//  Created by Protocol on 25/06/16.
//  Copyright © 2016 VideoConn. All rights reserved.
//

import UIKit

import Alamofire
import ImageSlideshow
import SwiftyJSON

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  
    
    
    @IBOutlet weak var viewSideHolder: UIView!
    @IBOutlet weak var viewBlur: UIView!
    @IBOutlet weak var viewPopup: UIView!
    @IBOutlet weak var viewResizer: UIView!
    
    var tapGesturee: UITapGestureRecognizer!
    
    @IBOutlet weak var constCenterX: NSLayoutConstraint!
    @IBOutlet weak var constCenterY: NSLayoutConstraint!
    @IBOutlet weak var constSize: NSLayoutConstraint!
    
    @IBOutlet weak var btnChat: UIButton!
    @IBOutlet weak var btnVideo: UIButton!
    @IBOutlet weak var btnProfile: UIButton!
    @IBOutlet weak var btnShop: UIButton!
    @IBOutlet weak var btnJobs: UIButton!
    
    @IBOutlet weak var btnContainer: UIButton!
    
    @IBOutlet weak var tblHome: UITableView!
    
    @IBOutlet weak var btnMenu: UIButton!
    @IBOutlet weak var btnRight: UIButton!
    
    @IBOutlet weak var constTop: NSLayoutConstraint!
    @IBOutlet weak var constBottom: NSLayoutConstraint!
    
    var viewToShow: NSInteger = 0
    var selected: NSInteger = 0
    let model = generateRandomData()
    var storedOffsets = [Int: CGFloat]()
    var retrivedData : NSMutableDictionary!
    var headers:NSMutableArray = NSMutableArray()
    var headersDict : NSDictionary = NSDictionary.init(dictionary:["Newly added":NEW_JSON_KEY, "Most viewed":MOST_JSON_KEY,"Featured":FEATURED_JSON_KEY,"Recent products":PRODUCT_LIST_JSON_KEY,"Recent shops":SHOP_LIST_JSON_KEY])
    
    //var sideVC: RightMenuVC!
    
    var hostFullURL :NSString?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loaddata()
//        let revealController:SWRevealViewController = self.revealViewController()
//        revealController.panGestureRecognizer()
//        revealController.tapGestureRecognizer()
//
//        self.btnMenu.addTarget(revealController, action: #selector(SWRevealViewController.revealToggle(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.tblHome.separatorStyle = UITableViewCellSeparatorStyle.none
        
        self.hostFullURL = NSString(format: HOST_URL as NSString,PATH)
        
    //    ProgressManager.showWithStatus("Loading...", onView: self.view)
        
        let dict : NSDictionary = ["requestFrom":"mobile","requestType":"new,most,featured","start":"0","limit":"5","userId":"1"]
        
        
      //  UserDefaults.retriveLoggedInUserId()
       // self.makeWSCall(self.hostFullURL as! String, postDict:dict, tag:0)
        
//        sideVC = self.storyboard?.instantiateViewControllerWithIdentifier("RightMenuVC") as! RightMenuVC
//        self.addChildViewController(sideVC)
//        self.viewSideHolder.addSubview(sideVC.view)
//        sideVC.didMoveToParentViewController(self)
//
//        sideVC.view.translatesAutoresizingMaskIntoConstraints = false
        
//        self.viewSideHolder.addConstraint(NSLayoutConstraint(item: sideVC.view, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self.viewSideHolder, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 0.0))
//        self.viewSideHolder.addConstraint(NSLayoutConstraint(item: sideVC.view, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self.viewSideHolder, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: 0.0))
//        self.viewSideHolder.addConstraint(NSLayoutConstraint(item: sideVC.view, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.viewSideHolder, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0.0))
//        self.viewSideHolder.addConstraint(NSLayoutConstraint(item: sideVC.view, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.viewSideHolder, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0))
//        self.view.layoutIfNeeded()
//
//        sideVC.btnMoreUsers.addTarget(self, action: #selector(userAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
//
//        sideVC.btnMoreChannels.addTarget(self, action: #selector(channelAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
//
        self.constTop.constant = -(UIScreen.main.bounds.size.height)
        self.constBottom.constant = (UIScreen.main.bounds.size.height)
        self.view.layoutIfNeeded()
        
        self.btnContainer.layer.cornerRadius = 15.0
        self.btnContainer.layer.masksToBounds = true
        
       // self.tblHome.setDragDelegate(self, refreshDatePermanentKey: "Table")
     //   self.tblHome.showRefreshView = false
      //  self.tblHome.showLoadMoreView = true
        
      //  self.showPopup(display: false, animated: false)
//        self.tapGesturee = UITapGestureRecognizer(target: self, action: #selector(dismissPopup))
//        self.tapGesturee.numberOfTapsRequired = 1
//        self.tapGesturee.numberOfTouchesRequired = 1
//        self.viewBlur.addGestureRecognizer(self.tapGesturee)
        
    //    let nc = NotificationCenter.defaultCenter()
    //    nc.addObserver(self,
                 //      selector: #selector(HomeVC.refreshTimeLine),
                    //   name: "LoginLogoutRefresh",
                     //  object: nil)
        
        // NSTimer(timeInterval: 80000, target: self, selector: Selector(setcallForProductList()), userInfo: nil, repeats: false)
        // self.setcallForProductList()
        
//        self.btnContainer.alpha = (UserDefaults.retriveLoggedInUserId().characters.count > 0) ?1.0:0
//        self.viewPopup.alpha = (UserDefaults.retriveLoggedInUserId().characters.count > 0) ?1.0:0
//        self.viewResizer.alpha = (NSUserDefaults.retriveLoggedInUserId().characters.count > 0) ?1.0:0
//
//        self.showPopup(false, animated: false)
        
        // Do any additional setup after loading the view.
    }
    
    
    func  loaddata()
    {
        
         //  let dict : NSDictionary = ["requestFrom":"mobile","requestType":"new,most,featured","start":"0","limit":"5","userId":"1"]
        
        let parameters = ["requestFrom": "mobile", "requestType": "new,most,featured","start":"0","limit":"5","userId":"1"]
        //   let token = UserDefaults.standard.object(forKey: "token")
        
        // print(token)
        
        //   let headers: HTTPHeaders = [
        //     "token": token as! String,
        
        //  ]
        
        
        //  let params: Parameters = [Parameter.email: username.text!,
        //  Parameter.password: pass.text!]
        
     
        //print(parameters)
        Alamofire.request("http://videoconnectt.net/mvc/webservice/", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
            
            .responseJSON { response in
                //debugPrint(response.data)
                
                switch(response.result){
                case .success(_):
                    let result = response.result
                    
                    let json = result.value as! NSDictionary
                    
                     print("----------\(json)")
                    
                    
                    
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
        
        
        
        
        
        
        
        
        
        
    }
    
    
    // MARK: - Table and collection delegate callbacks
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var identifier:String = ""
        
        if headers.count == 0 {
            identifier = (indexPath.row == 3) ?"Cell2":(indexPath.row == 4) ?"Cell3":"Cell1"
        } else {
            let header:String = headers.object(at: indexPath.row) as! String
            identifier = (header == "Recent products") ?"Cell2":(header == "Recent shops") ?"Cell3":"Cell1"
        }
        
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath as IndexPath) as! TableViewCell
        cell.layoutIfNeeded()
        
        cell.backgroundColor = UIColor.clear
        
        if headers.count > 0 {
            let title:String = headers.object(at: indexPath.row) as! String
            cell.lblTitle.text = title
        } else {
            cell.lblTitle.text = (indexPath.row == 0) ?"Newly added":(indexPath.row == 1) ?"Most viewed":(indexPath.row == 2) ?"Featured":(indexPath.row == 3) ?"Recent Products":"Recent Shops"
        }
        
    //    cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
        cell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
        cell.collectionView.tag = indexPath.row + 1000
        
        cell.btnMore.tag = indexPath.row + 5000
   //     cell.btnMore.addTarget(self, action: #selector(moreAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        var width: CGFloat = UIScreen.main.bounds.size.height * (240.0/568.0)
        var height: CGFloat = UIScreen.main.bounds.size.height * (((indexPath.row != 3 && indexPath.row != 4) ?180.0:150.0)/568.0)
        var inset: CGFloat = UIScreen.main.bounds.size.height * (10.0/568.0)
        
        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad {
            width = UIScreen.main.bounds.size.width * (310.0/768.0)
            height = UIScreen.main.bounds.size.height * (((indexPath.row != 3 && indexPath.row != 4) ?230.0:200.0)/1024.0)
            inset = UIScreen.main.bounds.size.width * (10.0/768.0)
        }
        
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize (width: width, height: height)
        flowLayout.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset)
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = inset
        flowLayout.scrollDirection = .horizontal
        cell.collectionView.collectionViewLayout = flowLayout
        
     //   dispatch_after(dispatch_time(dispatch_time_t(DispatchTime.now()), (Int64)(0.5 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
            cell.collectionView.reloadData()
     //   });
        
        return cell
    }
    
    func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        guard let tableViewCell = cell as? TableViewCell else { return }
        storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset
        
        /* let lastElement = headers.count - 1
         if indexPath.row == lastElement {
         self.tblHome.reloadData()
         }*/
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UIScreen.main.bounds.size.height * ((UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad) ?(310.0/1024.0):(240.0/568.0))
    }
    
   
    
}
