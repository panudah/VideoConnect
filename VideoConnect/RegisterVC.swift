//
//  RegisterVC.swift
//  VideoConnect
//
//  Created by Protocol on 05/08/16.
//  Copyright © 2016 VideoConn. All rights reserved.
//

import UIKit
import SVProgressHUD
import Alamofire

class RegisterVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var viewRegister: UIView!
    @IBOutlet weak var lblRegistration: UILabel!
    @IBOutlet weak var txtFirstName: CustomField!
    @IBOutlet weak var txtLastName: CustomField!
    @IBOutlet weak var txtEmail: CustomField!
    @IBOutlet weak var txtPassword: CustomField!
    @IBOutlet weak var txtConfirmPassword: CustomField!
    @IBOutlet weak var btnIndividual: UIButton!
    @IBOutlet weak var btnBusiness: UIButton!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var constContainerBottom: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
  
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)

     //   self.registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
      //  self.deregisterForKeyboardNotifications()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let color: UIColor = UIColor(red: 235.0/255.0, green: 0/255.0, blue: 132.0/255.0, alpha: 1.0)
        self.txtFirstName.layer.borderWidth = 1.0
        self.txtFirstName.layer.borderColor = color.cgColor
        
        self.txtLastName.layer.borderWidth = 1.0
        self.txtLastName.layer.borderColor = color.cgColor
        
        self.txtEmail.layer.borderWidth = 1.0
        self.txtEmail.layer.borderColor = color.cgColor
        
        self.txtPassword.layer.borderWidth = 1.0
        self.txtPassword.layer.borderColor = color.cgColor
        
        self.txtConfirmPassword.layer.borderWidth = 1.0
        self.txtConfirmPassword.layer.borderColor = color.cgColor
        
        self.btnSubmit.layer.borderWidth = 1.0
        self.btnSubmit.layer.borderColor = UIColor.white.cgColor
        
        self.btnSubmit.backgroundColor = UIColor.clear
    }
    
    // MARK:- Button Actions -
    
//    override func resignKeyboard(){
//        self.txtFirstName.resignFirstResponder()
//        self.txtLastName.resignFirstResponder()
//        self.txtEmail.resignFirstResponder()
//        self.txtPassword.resignFirstResponder()
//        self.txtConfirmPassword.resignFirstResponder()
//    }
//
    
    func alertview(msg : String) {
        let alert = UIAlertController(title: msg, message: nil, preferredStyle: .alert)
        let cancel = UIAlertAction.init(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil )
    }
    @IBAction func registerAction(sender: AnyObject) {
        if  (txtFirstName.text?.isEmpty)! {
            self.alertview(msg: "First name cannot be blank")
            print("gg")
        //ProgressManager.showErrorWithStatus("First name cannot be blank.")
        } else if  (txtLastName.text?.isEmpty)!  {
         //   ProgressManager.showErrorWithStatus("Last nale cannot be blank.")
             self.alertview(msg: "Last name cannot be blank.")
        } else if  (txtEmail.text?.isEmpty)! {
            
            
             self.alertview(msg: "Email cannot be blank.")
          //  ProgressManager.showErrorWithStatus("Email cannot be blank.")
        } else if self.isValidEmail(string:  self.txtEmail.text!) == false {
//          //  ProgressManager.showErrorWithStatus("Email is invalid.")
            
            self.alertview(msg: "Email is invalid.")

      }
            else if (txtPassword.text?.isEmpty)! {
            
            self.alertview(msg: "Password cannot be blank.")

         //   ProgressManager.showErrorWithStatus("Password cannot be blank.")
        } else if (self.txtPassword.text?.characters.count)! < 6 {
            self.alertview(msg: "Password must be atleast 6 character long.")
           // ProgressManager.showErrorWithStatus("Password must be atleast 6 character long.")
      }
            //else if self.isValidPassword(string: self.txtPassword.text!) == false {
//            self.alertview(msg: "Password must be between 6 to 20 characters with 1 upper case, 1 lower case, 1 numeric and 1 special character.")
//
//
//         //   ProgressManager.showErrorWithStatus("Password must be between 6 to 20 characters with 1 upper case, 1 lower case, 1 numeric and 1 special character.")
//        }
            else if self.txtPassword.text != self.txtConfirmPassword.text {
            
              self.alertview(msg: "Password does not match with confirm password.")
            
            print(self.btnIndividual.isSelected)
            
          //  ProgressManager.showErrorWithStatus("Password does not match with confirm password.")
        } else {
            
          //  Signing up...
            
            SVProgressHUD.show(withStatus: " Signing up...")
            let parameters = [
                "requestFrom":"mobile",
                "email":self.txtEmail.text!,
                "fname":self.txtFirstName.text!,
                "lname":self.txtLastName.text!,
                "upass":self.txtPassword.text!,
                "accountType":(self.btnIndividual.isSelected) ?"Individual":"Business",
             //   "accountType": "Individual",
                
                
                "regId":"12345"]
     
          
            Alamofire.request("http://videoconnectt.net/mvc/webservice/registration", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
                
                .responseJSON { response in
                    //debugPrint(response.data)
                    
                    switch(response.result){
                    case .success(_):
                        let result = response.result
                        
                        let json = result.value as! NSDictionary
                        
                         print("----------\(json)")
                        var dic = NSDictionary()
                        
                     //   dic = json["data"] as! NSDictionary
                        
                        let msg = json["info"] as! String
                        
                        
                       self.alertview(msg: msg)
                        

                        SVProgressHUD.dismiss()

                        
                        break
                        
                    case .failure(_):
                        print("Network Error")
                        SVProgressHUD.dismiss()
                        self.alertview(msg: "Check Your Internet Cinnection")
                        
                        //AppManager().AlertUser("", message: "Check Your Internet Cinnection", vc: self)
                        break
                        
                    }
            }
    }
    }
    
//    @IBAction func closeAction(sender: AnyObject) {
//        self.dismiss(animated: true, completion: nil)
//    }
        
        
    
    @IBAction func close(_ sender: Any) {
        
          self.dismiss(animated: true, completion: nil)
    }
    
    
        @IBAction func optionAction(_ sender: UIButton) {
            sender.isSelected = !sender.isSelected

        if sender == self.btnIndividual {
            self.btnBusiness.isSelected = !self.btnIndividual.isSelected
        } else {
            self.btnIndividual.isSelected = !self.btnBusiness.isSelected
        }
    }
    
  
    // MARK:- UITextFieldDelegate -
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func isValidEmail(string:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: string)
    }
    
    func isValidPassword(string:String) -> Bool {
        let passwordRegEx = "^(?=.*\\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[$@$!%*#?&]).{6,20}$"//"^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\\s).{4,8}$"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: string)
    }
    
 
    

    
  
    
  
   
   
}

