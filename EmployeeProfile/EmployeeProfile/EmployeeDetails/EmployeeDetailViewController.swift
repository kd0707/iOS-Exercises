//
//  ViewController.swift
//  EmployeeProfile
//
//  Created by Kamaluddin Khan on 02/11/18.
//  Copyright © 2018 Kamaluddin Khan. All rights reserved.
//

import UIKit
import CoreData

class EmployeeDetailViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var employeeDetails:Employee?
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var menteesField: UITextField!
    @IBOutlet weak var mentorField: UITextField!
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var experienceField: UITextField!
    @IBOutlet weak var skillField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var designationField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        try?fetchResultController.performFetch()
        addEditBarButton()
        setData()
        print(employeeDetails?.mentor?.id)
        print(employeeDetails?.mentees?.allObjects )
        menteesField.delegate = self
        mentorField.delegate = self
      
    }
    
    fileprivate lazy var fetchResultController: NSFetchedResultsController<Employee> = {
        var fetchRequest = NSFetchRequest<Employee>(entityName: "Employee")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        let fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: appDelegate.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
//        fetchResultController.delegate = self
        return fetchResultController
    }()
    
    
    @IBAction func updateAction(_ sender: Any) {
        updateData()
        mentorField.resignFirstResponder()
        
        var idArray:[String?] = idSplitter(id: menteesField.text!)
        for menteeId in idArray{
            guard menteeId != mentorField.text else{
                errorLabel.text = "Mentee can not be mentor"
                return
                }
            }
    
            for data in fetchResultController.fetchedObjects! {
                print(data.id)
                if data.id == Int16(mentorField.text!){
                    print(data)
                    data.addToMentees(employeeDetails!)
                }
        }
        navigationController?.popViewController(animated: true)
    }
    
    @objc func editAction() {
        nameField.isEnabled = true
        emailField.isEnabled = true
        skillField.isEnabled = true
        experienceField.isEnabled = true
        designationField.isEnabled = true
        mentorField.isEnabled = true
//        menteesField.isEnabled = true
       
    }
    
    func addEditBarButton()  {
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editAction))
        navigationItem.rightBarButtonItem = editButton
    }
    
    func setData() {
        if employeeDetails != nil{
            var menteeArray:String = ""
            
            nameField.text = employeeDetails?.name
            skillField.text = employeeDetails?.skill
            emailField.text = employeeDetails?.email
            experienceField.text = employeeDetails?.experience.description
            designationField.text = employeeDetails?.designation
            idField.text = employeeDetails?.id.description
            mentorField.text = employeeDetails?.mentor?.id.description ?? ""
            if ((employeeDetails?.mentees?.allObjects) != nil){
            for mentee in employeeDetails?.mentees?.allObjects as! [Employee] {
                menteeArray = menteeArray + mentee.id.description + ","
            }
            menteesField.text = menteeArray
            }else{
                menteesField.text = ""
            }
        }
    }
    
    //MARK:- Updating data
    func updateData() {
        if employeeDetails != nil{
            employeeDetails?.name = nameField.text
            employeeDetails?.skill = skillField.text
            employeeDetails?.email = emailField.text
            employeeDetails?.experience = Int16(experienceField.text!)!
            employeeDetails?.designation = designationField.text
            appDelegate.saveContext()
           
        }
    }
    
    //MARK:- Check Id validation
    func checkId(id:String) -> Bool {
        for data in fetchResultController.fetchedObjects! {
            print("kamalllll")
            if(data.id == Int16(id)){
                return false
            }
        }
        return true
    }
    
    //MARK:- Spliting Mentees id as array
    func idSplitter(id:String) -> [String] {
        let idArray = id.split{$0 == ","}.map(String.init)
        return idArray
    }
   
}

extension EmployeeDetailViewController: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        errorLabel.text = ""
    }
}
