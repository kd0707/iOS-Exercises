//
//  FormViewController.swift
//  EmployeeProfile
//
//  Created by Kamaluddin Khan on 01/11/18.
//  Copyright © 2018 Kamaluddin Khan. All rights reserved.
//

import UIKit
import CoreData

class FormViewController: UIViewController {
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var designationTextField: UITextField!
    @IBOutlet weak var skillTextField: UITextField!
    @IBOutlet weak var experienceTextField: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    fileprivate lazy var fetchResultController: NSFetchedResultsController<Employee> = {
        var fetchRequest = NSFetchRequest<Employee>(entityName: "Employee")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        let fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: appDelegate.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        
        return fetchResultController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        try?fetchResultController.performFetch()
    }
   
   
    @IBAction func saveEmployeeDetail(_ sender: Any) {
        saveData()
    }
    
    @IBAction func dissmissVievController(_ sender: Any) {
        self.dismiss(animated: true , completion: nil)
    }
    
}


extension FormViewController {
    
    func checkId(id:String) -> Bool {
        for data in fetchResultController.fetchedObjects! {
            print("kamalllll")
            if(data.id == Int16(id)){
                return false
            }
        }
        return true
    }
    
    func saveData() {
        let context = appDelegate.persistentContainer.viewContext
        let newEmployee = Employee(context: context)
        //        let entity = NSEntityDescription.entity(forEntityName: "Employee", in: context)
        
        guard checkId(id: idTextField.text!) else {
            errorLabel.text = "Id Already Exist"
            return
        }
        
        guard emailTextField.text!.isEmail else {
            errorLabel.text = "Enter a valid Email"
            return
        }
        
        newEmployee.name = nameTextField.text
        newEmployee.email = emailTextField.text
        newEmployee.designation = designationTextField.text
        newEmployee.skill = skillTextField.text
        newEmployee.experience = Int16(experienceTextField.text!)!
        newEmployee.id = Int16(idTextField.text!)!
        //        newEmployee.addToMentor(newEmployee)
        //        newEmployee.addToMentor([newEmployee,newEmployee])
        //        let entity = NSEntityDescription.entity(forEntityName: "Employee", in: context)
        //        let newEmployee = NSManagedObject(entity: entity!, insertInto: context)
        //        newEmployee.setValue(nameTextField.text, forKey: "name")
        //        newEmployee.setValue(emailTextField.text, forKey: "email")
        //        newEmployee.setValue(designationTextField.text, forKey: "designation")
        //        newEmployee.setValue(skillTextField.text, forKey: "skill")
        //        newEmployee.setValue(Int16(experienceTextField.text!), forKey: "experience")
        appDelegate.saveContext()
        self.dismiss(animated: true, completion: nil)
        print("Kamal")
    }
    
}
