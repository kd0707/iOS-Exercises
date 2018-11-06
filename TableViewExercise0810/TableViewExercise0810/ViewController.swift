//
//  ViewController.swift
//  TableViewExercise0810
//
//  Created by Kamaluddin Khan on 08/10/18.
//  Copyright © 2018 Kamaluddin Khan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var cellIdentity:String = "customeTableViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let nib = UINib(nibName: cellIdentity, bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: cellIdentity)
    }

    @IBAction func addDetailBtn(_ sender: Any) {
    }
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentity) as! customeTableViewCell
//    let i = UIImage(named: "ratingStar")
//   cell.titleLable.text = "kamal"
//    cell.descriptionLable.text = "Hello guys"
//    cell.imgV.image = UIImage(named: "ratingstar")
    
    
    return cell
}


}


