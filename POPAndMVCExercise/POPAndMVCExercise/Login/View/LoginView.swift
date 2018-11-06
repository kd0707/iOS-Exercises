//
//  LoginView.swift
//  POPAndMVCExercise
//
//  Created by Kamaluddin Khan on 24/10/18.
//  Copyright © 2018 Kamaluddin Khan. All rights reserved.
//

import UIKit

class LoginView: UIView {
    @IBOutlet weak var usernameTextField : UITextField?
    @IBOutlet weak var passwordTextField : UITextField?
    override func awakeFromNib() {
        super.awakeFromNib()
        usernameTextField?.delegate = self
        passwordTextField?.delegate = self
        
        print("kamal@j.com".isEmail)
    }


    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBAction func loginAction(_ sender: Any) {
       
        if loginValidation(){
           NotificationCenter.default.post(name: Notification.Name(loginNotificationKey), object: nil)
            print ("success")
            
        }
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        exit(0)
    }
}

extension LoginView {

    func loginValidation() -> Bool {
        
        guard let username = usernameTextField?.text, !username.isEmpty else {
            debugPrint("Enter Username")
            return false
        }
        print("Username:" ,username)
        guard let password = passwordTextField?.text, !password.isEmpty else {
            debugPrint("Enter Password")
            return false
        }
         print("Password:" ,username)
        if username.isEmail || username.isPhoneNumber {
            for key in KEYARRAY{
               if(UserDefaults.standard.stringArray(forKey: key)?.first == username && UserDefaults.standard.stringArray(forKey: key)?.last == password ){
                
                        return true
                    }
            }
        }else{
            debugPrint("Enter valid Email/Password")
            return false
        }
        debugPrint("Authentication Failed! Enter valid username and password")
        return false
    }
}

extension LoginView : UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField?.becomeFirstResponder()
        } else {
           loginAction("kamal")
        }
        return true
    }
}
