//
//  HomeVC.swift//  VideoConnect
//
//  Created by Protocol on 25/06/16.
//  Copyright © 2016 VideoConn. All rights reserved.
//

import UIKit

import Alamofire
import ImageSlideshow
import SwiftyJSON

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource,WebServiceDelegate {
  
  
    
    
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
 //   var headers: NSArray = []
     var headers:NSMutableArray = NSMutableArray()
   var headersDict : NSDictionary = NSDictionary.init(dictionary:["Newly added":NEW_JSON_KEY, "Most viewed":MOST_JSON_KEY,"Featured":FEATURED_JSON_KEY,"Recent products":PRODUCT_LIST_JSON_KEY,"Recent shops":SHOP_LIST_JSON_KEY])
    
    //var sideVC: RightMenuVC!
    
    var hostFullURL :NSString?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
  //  loaddata()
//        let revealController:SWRevealViewController = self.revealViewController()
//        revealController.panGestureRecognizer()
//        revealController.tapGestureRecognizer()
//
//        self.btnMenu.addTarget(revealController, action: #selector(SWRevealViewController.revealToggle(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.tblHome.separatorStyle = UITableViewCellSeparatorStyle.none
        
        self.hostFullURL = NSString(format: HOST_URL as String as NSString,PATH)
        
    //    ProgressManager.showWithStatus("Loading...", onView: self.view)
        
        let dict : NSDictionary = ["requestFrom":"mobile","requestType":"new,most,featured","start":"0","limit":"5","userId":"1"]
        
        
      //  UserDefaults.retriveLoggedInUserId()
        self.makeWSCall(url: self.hostFullURL as! String , postDict:dict, tag:0)
        
//        sideVC = self.storyboard?.instantiateViewControllerWithIdentifier("RightMenuVC") as! RightMenuVC
//        self.addChildViewController(sideVC)
//        self.viewSideHolder.addSubview(sideVC.view)
//        sideVC.didMoveToParentViewController(self)
//
//        sideVC.view.translatesAutoresizingMaskIntoConstraints = false
        
//        self.viewSideHolder.addConstraint(NSLayoutConstraint(item: .sideVC.view, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self.viewSideHolder, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 0.0))
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
        
        self.showPopup(display: false, animated: false)
        self.tapGesturee = UITapGestureRecognizer(target: self, action: #selector(dismissPopup))
        self.tapGesturee.numberOfTapsRequired = 1
        self.tapGesturee.numberOfTouchesRequired = 1
        self.viewBlur.addGestureRecognizer(self.tapGesturee)
        
    //    let nc = NotificationCenter.defaultCenter()
    //    nc.addObserver(self,
                 //      selector: #selector(HomeVC.refreshTimeLine),
                    //   name: "LoginLogoutRefresh",
                     //  object: nil)
        
        // NSTimer(timeInterval: 80000, target: self, selector: Selector(setcallForProductList()), userInfo: nil, repeats: false)
        // self.setcallForProductList()
        
   //    self.btnContainer.alpha = (UserDefaults.retriveLoggedInUserId().characters.count > 0) ?1.0:0
//        self.viewPopup.alpha = (UserDefaults.retriveLoggedInUserId().characters.count > 0) ?1.0:0
//        self.viewResizer.alpha = (NSUserDefaults.retriveLoggedInUserId().characters.count > 0) ?1.0:0
//
        
        self.btnContainer.alpha = 1.0
          self.viewPopup.alpha = 1.0
       self.viewResizer.alpha = 1.0
        self.showPopup(display: false, animated: false)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.showPopup(display: false, animated: false)
    }
//
//    @IBAction func menuAction(sender: AnyObject) {
//        UIView.animate(withDuration: 0.3) {
//            self.btnRight?.transform = CGAffineTransform(rotationAngle: (self.constTop.constant < 0) ?(270.degreesToRadians):0.degreesToRadians)
//
//            self.constTop.constant = (self.constTop.constant < 0) ?0:-(UIScreen.main.bounds.size.height)
//            self.constBottom.constant = (self.constBottom.constant > 0) ?0:(UIScreen.main.bounds.size.height)
//
//            self.view.layoutIfNeeded()
//
//            if self.constTop.constant == 0 {
//                self.view.bringSubview(toFront: self.viewSideHolder)
//             //   self.sideVC.setUserWSCall()
//            }
//        }
//    }
    
     @IBAction func popupAction(sender: AnyObject) {
      //  (self.viewBlur.alpha == 0)
        self.showPopup(display: (self.viewBlur.alpha == 0), animated: true)
    }
    func showPopup(display:Bool, animated: Bool) {
        UIView.animate(withDuration: (animated) ?0.3:0, animations: {
            self.btnVideo.layer.cornerRadius = (display) ?22.5:2
            self.btnVideo.layer.masksToBounds = true
            self.btnVideo.setTitle((display) ?"Video":"", for: .normal)
            self.btnVideo.setImage((display) ?UIImage(named:"ic_videocam_white"):nil, for: .normal)
            
            self.btnChat.layer.cornerRadius = (display) ?22.5:2
            self.btnChat.layer.masksToBounds = true
            self.btnChat.setTitle((display) ?"Chat":"", for: .normal)
            self.btnChat.setImage((display) ?UIImage(named:"ic_chat_white"):nil, for: .normal)
            
            self.btnProfile.layer.cornerRadius = (display) ?22.5:2
            self.btnProfile.layer.masksToBounds = true
            self.btnProfile.setTitle((display) ?"Profile":"", for: .normal)
            self.btnProfile.setImage((display) ?UIImage(named:"ic_person_outline_white"):nil, for: .normal)
            
            self.btnShop.layer.cornerRadius = (display) ?22.5:2
            self.btnShop.layer.masksToBounds = true
            self.btnShop.setTitle((display) ?"Shop":"", for: .normal)
            self.btnShop.setImage((display) ?UIImage(named:"ic_local_grocery_store_white"):nil, for:.normal)
            
            self.btnJobs.layer.cornerRadius = (display) ?22.5:2
            self.btnJobs.layer.masksToBounds = true
            self.btnJobs.setTitle((display) ?"Jobs":"", for: .normal)
            self.btnJobs.setImage((display) ?UIImage(named:"ic_file_upload_white"):nil, for:.normal)
            
            self.viewBlur.alpha = (display) ?1.0:0
            self.constSize.constant = (display) ?300:30
            self.constCenterX.constant = (display == false) ?(self.btnContainer.frame.origin.x - (self.view.frame.size.width/2.0)) + 15.0:0
            self.constCenterY.constant = (display == false) ?(self.btnContainer.frame.origin.y - (self.view.frame.size.height/2.0)) + 15.0:0
            self.view.layoutIfNeeded()
        }) { (finished:Bool) in
        }
    }
    
    @objc func dismissPopup() {
        self.showPopup(display: false, animated: true)

    }
    
    func  makeWSCall(url:String , postDict:NSDictionary , tag:Int) {
        
        let httpRequest :HTTPRequest = HTTPRequest()
        httpRequest.delegate = self
        httpRequest.fetchContents(hostURL: url as NSString, dictionary: postDict, tag: tag,requestType:"POST", timeoutInterval:30.0)
        
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
                    
          // print("----------\(json)")
                 var dic = NSDictionary()
                    
               dic = json["data"] as! NSDictionary
                    
                    
                   // self.headers = ary_data["featured"] as! NSArray
              print("fgfgfg \(dic)")
                    
                    
                   // self.headers = dic["featured"] as! NSArray
                    
                    print("the ball \(self.headers)")
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
    
    internal func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? TableViewCell else { return }
        storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset
        
        /* let lastElement = headers.count - 1
         if indexPath.row == lastElement {
         self.tblHome.reloadData()
         }*/
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.size.height * ((UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad) ?(310.0/1024.0):(240.0/568.0))
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if  headers.count > 0 {
            return 5
        } else {
            return 0
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let header:String = headers.object(at: collectionView.tag - 1000) as! String
        let type:String = headersDict.value(forKey: header) as! String
        let arrays : NSArray = retrivedData.value(forKey: type) as! NSArray
        let index : NSInteger = (indexPath.section * 5) + indexPath.row
            let cell: VideoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell1", for: indexPath as IndexPath) as! VideoCollectionViewCell 
        if (header == "Newly added") || (header == "Most viewed") || (header == "Featured")    {
            
           let cell: VideoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell1", for: indexPath as IndexPath) as! VideoCollectionViewCell
            
            cell.layoutIfNeeded()
            
            let video:Video = arrays.object(at: index) as! Video
            
            cell.lblDetails.text = video.title
           // cell.lblUserName.text = video.user.userName
            
        //    cell.imageTop.setAsyncImage(DEFAULT_IMG, url:video.user.profileImg)
      //  cell.bgView.setAsyncImage(DEFAULT_IMG, url:video.thumbImg)
            
            cell.imageTop.setRounded(borderWidth: 1.0, borderColor:UIColor.white )
            
            cell.layer.cornerRadius = (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad) ?15.0:6.0
            cell.layer.masksToBounds = true
            cell.clipsToBounds = true
            
//            cell.btnWatchedCount.setTitle(video.views, forState: UIControlState.Normal)
//            cell.btnLikedCount.setTitle(video.like, forState: UIControlState.Normal)
//            cell.btnDislikedCount.setTitle(video.dislike, forState: UIControlState.Normal)
//            cell.btnFavouritedCount.setTitle(video.fav, forState: UIControlState.Normal)
//            cell.btnCommentedCount.setTitle(video.comment, forState: UIControlState.Normal)
            
            cell.layoutIfNeeded()
            cell.backgroundColor = UIColor.clear
        }
            return cell
            
      //  }
            
    
   }
   
    
//    @IBAction func callAction(sender: UIButton) {
//        self.makeCallToNumber((sender.object as! Shop).mobile as String)
//    }
//
//    @IBAction func emailAction(sender: UIButton) {
//        self.openMailClient((sender.object as! Shop).email as String)
//    }
    
//    @IBAction func webSiteAction(sender: UIButton) {
//        self.openWebURL((sender.object as! Shop).shopURL as String)
//    }
//    
  //  func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
       // print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
        
      /*  let stbrd:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let indx: Int =  collectionView.tag - 1000
        
        let header:String = headers.objectAtIndex(indx) as! String
        
        let type:String = headersDict.valueForKey(header) as! String
        
        let arrays : NSArray = retrivedData.valueForKey(type) as! NSArray
        let index : NSInteger = (indexPath.section * 5) + indexPath.row
        
        if (header == "Newly added") || (header == "Most viewed") || (header == "Featured"){
            let video:Video = arrays.objectAtIndex(index) as! Video
            
            if video.type == "y" {
                let detailsVC:NewVideoDetailsVC =  (stbrd.instantiateViewControllerWithIdentifier("NewVideoDetailsVC") as? NewVideoDetailsVC)!
                detailsVC.youtubeId = video.videoId
                detailsVC.videoObj = video
                self.title = ""
                self.navigationController?.pushViewController(detailsVC, animated: true)
            }
            
        }
        else if (header == "Recent products") {
        }
        else { // Shops
            
            
            let shop:Shop = arrays.objectAtIndex(index) as! Shop
            
            let detailsVC:NewShopDetailsVC =  (stbrd.instantiateViewControllerWithIdentifier("NewShopDetailsVC") as? NewShopDetailsVC)!
            
            detailsVC.shopObj = shop
            self.title = ""
            self.navigationController?.pushViewController(detailsVC, animated: true)
            
        }*/
        
        
        
        
        
    //}
   
    // MARK: - WebServiceDelegate
    
    func didFinishWithError(error error: NSError?, response dict: NSDictionary, object httpRequest: HTTPRequest) {
        
        
     //   dispatch_get_main_queue().async(){
         //   ProgressManager.dismiss()
            if (error == nil) {
                
                if (httpRequest.tag == 0) { // Newly added,Most viewed,Featured viedoes
                    
                    
                    let homeParser:HomeVCParser = JSONFactory().getParser(parserType: 1) as! HomeVCParser
                    self.retrivedData = homeParser.getParsedData(dataDict: dict)
                    if  self.headers.count > 0 {
                       // self.headers.removeAllObjects()
                    }
                    
                    if self.retrivedData[NEW_JSON_KEY] != nil {
                        self.headers.add("Newly added")
                    }
                    if self.retrivedData[MOST_JSON_KEY] != nil {
                        self.headers.add("Most viewed")
                    }
                    if self.retrivedData[FEATURED_JSON_KEY] != nil {
                        self.headers.add("Featured")
                    }
                    
                    if self.headers.count > 0 {
                        self.tblHome.reloadData()
                    }
                    /*_ = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector:  #selector(HomeVC.setcallForProductList), userInfo: nil, repeats: false)*/
                }
                else if httpRequest.tag == 1 { // Products
                    
//                    let productJSONParser:ProductJSONParser = JSONFactory().getParser(3) as! ProductJSONParser
//                    let retrivedArr:NSMutableArray = productJSONParser.getParsedData(dict, jsonKey: PRODUCT_LIST_JSON_KEY)
//
//                    self.finishLoadMore()
//
//
//                    if retrivedArr.count > 0 {
//                        self.retrivedData.setValue(retrivedArr, forKey: PRODUCT_LIST_JSON_KEY)
//                        self.headers.addObject("Recent products")
//                        self.tblHome.reloadData()
//                    }
//
                    /*_ = NSTimer.scheduledTimerWithTimeInterval(8, target: self, selector:  #selector(HomeVC.setcallForShopList), userInfo: nil, repeats: false)*/
                    
                }
                    
                else if httpRequest.tag == 2 { // Shops
                    
//                    let shopJSONParser:ShopJSONParser = JSONFactory().getParser(4) as! ShopJSONParser
//                    let retrivedArr:NSMutableArray = shopJSONParser.getParsedData(dict, jsonKey: SHOP_LIST_JSON_KEY)
//
//                    self.finishLoadMore()
//                    self.tblHome.showLoadMoreView = false
//
//                    if retrivedArr.count > 0 {
//                        self.retrivedData.setValue(retrivedArr, forKey: SHOP_LIST_JSON_KEY)
//                        self.headers.addObject("Recent shops")
//                        self.tblHome.reloadData()
//                    }
                    
                }
                
            }
                
            else {
                
              //  self.finishLoadMore()
                
            }
            
      //  }
        
        
    }
    
}

