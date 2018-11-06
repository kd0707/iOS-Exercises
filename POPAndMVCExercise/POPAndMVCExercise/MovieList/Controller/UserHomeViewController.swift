//
//  UserHomeViewController.swift
//  POPAndMVCExercise
//
//  Created by Kamaluddin Khan on 26/10/18.
//  Copyright © 2018 Kamaluddin Khan. All rights reserved.
//

import UIKit

class UserHomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Kamal")
        customViewAdd()
        addLogoutButton()
        navigationItem.hidesBackButton = true        
    }
    @objc func logOutAction() {
        print("kamallooo")
         UserDefaults.standard.set(false, forKey: LOGINSTATUS)
       
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let userHomeViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            let navigationRoot = UINavigationController(rootViewController: userHomeViewController)
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = navigationRoot
        
//        self.navigationController?.popToRootViewController(animated: true)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UserHomeViewController {
   private func customViewAdd() {
        let viewNib = UINib(nibName: "MovieTableView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! MovieTableView
    
    viewNib.center = CGPoint(x: view.frame.size.width  / 2,
                             y: view.frame.size.height / 2)
    self.view.addSubview(viewNib)
    }
    private func addLogoutButton(){
        let logOutButton = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(logOutAction))
        navigationItem.rightBarButtonItem = logOutButton
    }
    }

