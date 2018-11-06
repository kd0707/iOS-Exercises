//
//  ViewController.swift
//  EmployeeProfile
//
//  Created by Kamaluddin Khan on 01/11/18.
//  Copyright © 2018 Kamaluddin Khan. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var employeeTableView: UITableView!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private let persistentContainer = NSPersistentContainer(name: "EmployeeProfile")

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(urls[urls.count-1] as URL)
    }
    
    fileprivate lazy var fetchResultController: NSFetchedResultsController<Employee> = {
        
        var fetchRequest = NSFetchRequest<Employee>(entityName: "Employee")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
        let fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: appDelegate.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        fetchResultController.delegate = self
        
        return fetchResultController
    }()


    @IBAction func addEmployeeDetails(_ sender: Any) {
        let formViewController = storyboard?.instantiateViewController(withIdentifier: "FormViewController") as! FormViewController
        self.present(formViewController, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchResultController.sections?[section].numberOfObjects ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = employeeTableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        let data = fetchResultController.object(at: indexPath)
        tableViewCell.nameCellLabel.text = data.name
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let employeeDetailViewController = storyboard?.instantiateViewController(withIdentifier: "EmployeeDetailViewController") as! EmployeeDetailViewController
        employeeDetailViewController.employeeDetails = fetchResultController.object(at: indexPath)
        
      self.navigationController?.pushViewController(employeeDetailViewController, animated: true)
        
    }
}

extension ViewController: NSFetchedResultsControllerDelegate{
    
     func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?){
//        reloadData()
        employeeTableView.reloadData()
        
    }
    
    func loadData()  {
//               fetchResultController.fetchRequest.predicate = NSPredicate(format: "name == %@",  argumentArray: ["KD1","KD2"])
        //        fetchResultController.fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        try? fetchResultController.performFetch()
//        employeeTableView.reloadData()
    }

    
}

