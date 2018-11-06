//
//  ViewController.swift
//  CoreDataExercise
//
//  Created by Kamaluddin Khan on 31/10/18.
//  Copyright © 2018 Kamaluddin Khan. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    let cellIdentifier = "TableViewCell"
    var recipe = [Recipe]()
    
    @IBOutlet weak var recipeTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        coreDataManage()
//        var moc = CoreDataManager.sharedInstance.managedObjectContext
//        let fetchRequest: NSFetchRequest<Recipe> = Recipe.fetchRequest()
//        let recipeArray =   try? moc.fetch(fetchRequest)
//        self.recipe = recipeArray!
       reloadData()
        coreDataManageInBackground()
//        coreDataManageInBackground()
//         recipeTableView.reloadData()
        
        // Do any additional setup after loading the view, typically from a nib.
        
      
        
    }
    
    fileprivate lazy var fetchResultController: NSFetchedResultsController<Recipe> = {

        var fetchRequest = NSFetchRequest<Recipe>(entityName: "Recipe")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
        let fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataManager.sharedInstance.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        fetchResultController.delegate = self
            
        
////        fetchRequest.fetchBatchSize = 30
//
//        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
//
//        let fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataManager.sharedInstance.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
//
//        fetchResultController.delegate = self
//
//
        return fetchResultController
    }()
    
    func reloadData()  {
//        fetchResultController.fetchRequest.predicate = NSPredicate(format: "name == %@",  argumentArray: ["KD11","KD2"])
//        fetchResultController.fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        try? fetchResultController.performFetch()
        recipeTableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        guard let quotes = fetchResultController.fetchedObjects else { return 0 }
//        return quotes.count
        return fetchResultController.sections?[section].numberOfObjects ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! TableViewCell
        
        let data = fetchResultController.object(at: indexPath) as! Recipe
//        tableViewCell.idLabel.text = Int32(recipe[indexPath.row].id).description
//        tableViewCell.nameLabel.text = recipe[indexPath.row].name
        tableViewCell.idLabel.text = data.id.description
        tableViewCell.nameLabel.text = data.name
        return tableViewCell
        
    }
}

extension ViewController{
    func coreDataManage(){
        let moc = CoreDataManager.sharedInstance.managedObjectContext
        let entity = NSEntityDescription.entity(forEntityName: "Recipe", in: moc)
        
        for id in 0...19909{
            print(id)
            let newRecipe =  NSManagedObject.init(entity: entity!, insertInto: moc)
            newRecipe.setValue(id, forKey: "id")
            newRecipe.setValue("Aaaaa\(id)", forKey: "name")
            CoreDataManager.sharedInstance.saveContext()
        }
        
        let fetchRequest: NSFetchRequest<Recipe> = Recipe.fetchRequest()
        let recipeArray =   try? moc.fetch(fetchRequest)
        recipe = recipeArray!
        self.recipeTableView.reloadData()
    }
    
    
    func coreDataManageInBackground()  {
        let moc = CoreDataManager.sharedInstance.managedObjectContext
        let entity = NSEntityDescription.entity(forEntityName: "Recipe", in: moc)
        CoreDataManager.sharedInstance.persistentContainer.performBackgroundTask({(context) in
            for id in 0...1900{
                print(id)
                let newRecipe =  NSManagedObject.init(entity: entity!, insertInto: moc)
                                newRecipe.setValue(id, forKey: "id")
                                newRecipe.setValue("KD\(id)", forKey: "name")
                               try? context.save()
                                moc.performAndWait {
                                    try? moc.save()
                                }
                            }
           
          
            
//        let moc = CoreDataManager.sharedInstance.persistentContainer.performBackgroundTask({ (managedObjectContext) in
//           let entity = NSEntityDescription.entity(forEntityName: "Recipe", in: managedObjectContext)
//            for id in 0...1999{
//                let newRecipe =  NSManagedObject.init(entity: entity!, insertInto: managedObjectContext)
//                newRecipe.setValue(id, forKey: "id")
//                newRecipe.setValue("Kamal\(id)", forKey: "name")
//                CoreDataManager.sharedInstance.saveContext()
//            }
           
//
//
////            try?managedObjectContext.save()
//
//            })
            
//            self.recipeTableView.reloadData()
        })
        let fetchRequest: NSFetchRequest<Recipe> = Recipe.fetchRequest()
        let recipeArray =   try? moc.fetch(fetchRequest)
        self.recipe = recipeArray!
        self.recipeTableView.reloadData()

       
        }
    
}

extension ViewController: NSFetchedResultsControllerDelegate{
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
    recipeTableView.reloadData()
    }
}
