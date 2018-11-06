//
//  SenderViewController.swift
//  DelegateExercise0910
//
//  Created by Kamaluddin Khan on 11/10/18.
//  Copyright © 2018 Kamaluddin Khan. All rights reserved.
//

import UIKit

protocol  SenderViewControllerDelegate{
    func sendData(name:String,gender:String,email:String,contact:String)
}
class SenderViewController: UIViewController {
     var delegate:SenderViewControllerDelegate?
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var contactText: UITextField!
    @IBOutlet weak var genderSegment: UISegmentedControl!
    @IBOutlet weak var errorLable: UILabel!
    var dataDic:[String:String] = [:]
  
    override func viewDidLoad() {
        super.viewDidLoad()
        genderSegment.selectedSegmentIndex = -1
    }
    override func viewDidDisappear(_ animated: Bool) {
        dataDic["name"] = nameText.text
        dataDic["gender"] = genderSegment.titleForSegment(at: genderSegment.selectedSegmentIndex)!
        dataDic["email"] = emailText.text
        dataDic["contact"] = contactText.text
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "SenderViewControllerNotification"), object: nil, userInfo: dataDic)
    }
    
    @IBAction func goBackAction(_ sender: Any) {
          if(checkRequiredField()){
        delegate?.sendData(name: nameText.text!, gender: genderSegment.titleForSegment(at: genderSegment.selectedSegmentIndex)!, email: emailText.text!, contact: contactText.text!)
        self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func sendDataWithNotification(_ sender: Any) {
          if(checkRequiredField()){
        self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func notificationActionForNext(_ sender: Any) {
        if(checkRequiredField()){
        let thirdViewController = storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        self.navigationController?.pushViewController(thirdViewController, animated: true)
        }
     }
    
    func checkRequiredField() -> Bool {
        if(nameText.text == ""){
            errorLable.text = "Please Enter Name"
            return false
        }
        if(genderSegment.selectedSegmentIndex < 0 ){
            errorLable.text = "Please select gender"
            return false
        }
        if(emailText.text == "" ){
            errorLable.text = "Please enter email"
            return false
        }
        if((emailText.text?.contains("@"))!){}else{
            errorLable.text = "Please enter valid email"
            return false
        }
        if(contactText.text == "" ){
            errorLable.text = "Please enter contact"
            return false
        }
        if contactText.text?.count != 10{
            errorLable.text = "Enter valid contact number"
            return false
        }
        return true
        
    }
    
    
}
