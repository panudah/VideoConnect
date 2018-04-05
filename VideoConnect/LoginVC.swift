//
//  LoginVC.swift
//  VideoConnect
//
//  Created by Protocol on 05/07/16.
//  Copyright © 2016 VideoConn. All rights reserved.
//

import UIKit

class LoginVC: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var viewLogin: UIView!
    @IBOutlet weak var lblLogin: UILabel!
    @IBOutlet weak var txtEmail: CustomField!
    @IBOutlet weak var txtPassword: CustomField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnForgetPassword: UIButton!
    @IBOutlet weak var constContainerBottom: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
}
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.lblLogin.layer.cornerRadius = 4.0
        self.lblLogin.layer.masksToBounds = true
        
        let color: UIColor = UIColor(red: 235.0/255.0, green: 0/255.0, blue: 132.0/255.0, alpha: 1.0)
        self.txtEmail.layer.borderWidth = 1.0
        self.txtEmail.layer.borderColor = color.cgColor
        
        self.txtPassword.layer.borderWidth = 1.0
        self.txtPassword.layer.borderColor = color.cgColor
        
        self.btnLogin.layer.borderWidth = 1.0
        self.btnLogin.layer.borderColor = color.cgColor
        
        self.btnLogin.backgroundColor = UIColor.clear
    }
    
    // MARK:- Button Actions -
    
//    override func resignKeyboard(){
//        self.txtEmail.resignFirstResponder()
//        self.txtPassword.resignFirstResponder()
//    }
    
    @IBAction func loginAction(_ sender: AnyObject) {
        if self.txtEmail.text?.characters.count == 0 {
          //  ProgressManager.showErrorWithStatus("Email cannot be blank.")
        } else if self.isValidEmail(string:  self.txtEmail.text!) == false  {
          //  ProgressManager.showErrorWithStatus("Email is invalid.")
        } else if self.txtPassword.text?.characters.count == 0 {
         //   ProgressManager.showErrorWithStatus("Password cannot be blank.")
        } else if (self.txtPassword.text?.characters.count)! < 6 {
         //   ProgressManager.showErrorWithStatus("Password must be atleast 6 character long.")
        } else /*if self.isValidPassword(self.txtPassword.text!) == false {
            ProgressManager.showErrorWithStatus("Password must be between 6 to 20 characters with 1 upper case, 1 lower case, 1 numeric and 1 special character.")
        } else*/ {
            let parameters: NSDictionary = [
                "requestFrom":"mobile",
                "username":self.txtEmail.text!,
                "password":self.txtPassword.text!,
                "regId":"123"]
            self.view.endEditing(true)
       //     ProgressManager.showWithStatus("Logging in...")
//            APIManager.sendPostRequest("login", parameter: parameters) { (response, error) in
//                if error == nil {
//                    NSUserDefaults.saveDataForKey(LOGIN_SAVE_KEY, objectToSaved:(response?.objectForKey("login"))!)
//                    ProgressManager.showSuccessWithStatus(response!["info"] as? String, completion: {
//                        self.dismissViewControllerAnimated(true, completion: nil)
//
//                        let nc = NSNotificationCenter.defaultCenter()
//                        nc.postNotificationName("LoginLogoutRefresh",
//                            object: nil,
//                            userInfo:nil)
//
//                    })
//                } else {
//                    ProgressManager.dismiss()
//                    if error != nil {
//                        ProgressManager.showErrorWithStatus(error)
//                    }
//                }
//            }
        }
    }
    
    @IBAction func forgetAction(sender: AnyObject) {
        
    }
    func isValidEmail(string:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: string)
    }
    @IBAction func closeAction(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK:- Custom Functions -
    
  
    
  
    // MARK:- UITextFieldDelegate -
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
