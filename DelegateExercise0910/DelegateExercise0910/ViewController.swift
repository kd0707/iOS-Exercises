//
//  ViewController.swift
//  DelegateExercise0910
//
//  Created by Kamaluddin Khan on 11/10/18.
//  Copyright © 2018 Kamaluddin Khan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var genderLable: UILabel!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var emailLable: UILabel!
    @IBOutlet weak var contactLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(recievingNotificationCenterData(_:)), name: Notification.Name(rawValue: "SenderViewControllerNotification"), object: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
       NotificationCenter.default.removeObserver("Done")
    }
    @IBAction func nextStepAction(_ sender: Any) {
        let senderViewController = storyboard?.instantiateViewController(withIdentifier: "SenderViewController") as! SenderViewController
        senderViewController.delegate = self
         self.navigationController?.pushViewController(senderViewController, animated: true)
    }
    //MARK:- NOtification Recieve Action
    @objc func  recievingNotificationCenterData(_ notification:Notification) {
        let userInfo = notification.userInfo
        genderLable.text = (userInfo!["gender"] as? String)
        nameLable.text = userInfo!["name"] as? String
        emailLable.text = userInfo!["email"] as? String
        contactLable.text = userInfo!["contact"] as? String
    }
}


extension ViewController:SenderViewControllerDelegate{
    func sendData(name: String, gender: String, email: String, contact: String) {
        genderLable.text = gender
        nameLable.text = name
        emailLable.text = email
        contactLable.text = contact
    }
}



