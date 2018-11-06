//
//  ViewController.swift
//  POPAndMVCExercise
//
//  Created by Kamaluddin Khan on 24/10/18.
//  Copyright © 2018 Kamaluddin Khan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    let userHomeControllerIdentifier = "UserHomeViewController"

    override func viewDidLoad() {
        super.viewDidLoad()
        setRootView()
        setBackground()
        customeView()
         NotificationCenter.default.addObserver(self, selector: #selector(navigateController), name: Notification.Name(rawValue: loginNotificationKey), object: nil)
              storeDataInUserDefault()
    }
}


extension LoginViewController{
    
   private func customeView() {
        let viewNib = UINib(nibName: "LoginView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! LoginView
        viewNib.center = CGPoint(x: view.frame.size.width  / 2,
                                 y: view.frame.size.height / 2)
        self.view.addSubview(viewNib)
   
    
        //        NSLayoutConstraint(item: viewNib, attribute: .top, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1, constant: 50).isActive = true
        //        NSLayoutConstraint(item: viewNib, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 20).isActive = true
        //        NSLayoutConstraint(item: viewNib, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottomMargin, multiplier: 1, constant: 50).isActive = true
        //        NSLayoutConstraint(item: viewNib, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 20).isActive = true
    }
    
    func setBackground() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(imageLiteralResourceName: "LoginBackground"))
    }
    
    func storeDataInUserDefault() {
        UserDefaults.standard.set(["kd@ttn.com","ttn"], forKey: KEYARRAY[0])
        UserDefaults.standard.set(["rohan@ttn.com","ttn"], forKey: KEYARRAY[1])
        UserDefaults.standard.set(["suraj@ttn.com","ttn"], forKey: KEYARRAY[2] )
        UserDefaults.standard.set(false, forKey: LOGINSTATUS)
    }
    
}

extension LoginViewController{
    @objc func navigateController() {
        let userHomeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: userHomeControllerIdentifier) as! UserHomeViewController
        self.navigationController?.pushViewController(userHomeViewController, animated: true)
       UserDefaults.standard.set(true, forKey: LOGINSTATUS)
        print(UserDefaults.standard.bool(forKey: LOGINSTATUS))
        
    }
    
    
    func  setRootView() {
        let flag: Bool = UserDefaults.standard.bool(forKey: LOGINSTATUS)
        print(UserDefaults.standard.bool(forKey: LOGINSTATUS))
        
        if flag {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let userHomeViewController = storyboard.instantiateViewController(withIdentifier: userHomeControllerIdentifier) as! UserHomeViewController
            let navigationRoot = UINavigationController(rootViewController: userHomeViewController)
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = navigationRoot
        }
    }
    
    
}
