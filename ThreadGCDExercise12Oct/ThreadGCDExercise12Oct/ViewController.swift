//
//  ViewController.swift
//  ThreadGCDExercise12Oct
//
//  Created by Kamaluddin Khan on 14/10/18.
//  Copyright © 2018 Kamaluddin Khan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var imageStringArray:[String] = ["https://res.cloudinary.com/he9fywsrk/image/upload/c_fill,d_no-recipe-image/fubx40trlx4ukrpshqnl",
                                     "https://res.cloudinary.com/he9fywsrk/image/upload/c_fill,d_no-recipe-image/fubx40trlx4ukrpshqnl",
                                     "https://res.cloudinary.com/he9fywsrk/image/upload/c_fill,d_no-recipe-image/fubx40trlx4ukrpshqnl"]
    var nameArray = ["Kamal","KD","Kamaluddin"]
    var ageArray = [24,22,23]
    var imageData :Data? = nil
    var time = DispatchTime.now()
    @IBOutlet weak var personDetailTableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let personCellNib = UINib(nibName: "PersonDetailTableViewCell", bundle: nil)
        personDetailTableView?.register(personCellNib, forCellReuseIdentifier: "PersonDetailTableViewCell")
        personDetailTableView?.rowHeight = UITableView.automaticDimension
        personDetailTableView?.estimatedRowHeight = 91
        // Do any additional setup after loading the view, typically from a nib.
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let personDetailCell = personDetailTableView?.dequeueReusableCell(withIdentifier: "PersonDetailTableViewCell") as! PersonDetailTableViewCell
        time = time + 5
        DispatchQueue.global(qos: .background).asyncAfter(deadline: time, execute:  {
            let url = URL.init(string: self.imageStringArray[indexPath.row])
            do{
                self.imageData = try Data.init(contentsOf: url!)
            }
            catch{}
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now(), execute: {
                personDetailCell.setData(name: self.nameArray[indexPath.row],
                                         age: self.ageArray[indexPath.row].description,
                                         image: UIImage.init(data: self.imageData!)!)
                
                personDetailCell.imageActivityLoader?.stopAnimating()
            })
        })
        
        print( self.nameArray[indexPath.row], self.ageArray[indexPath.row].description)
//       personDetailCell.setData(name: self.nameArray[indexPath.row], age: self.ageArray[indexPath.row].description, image: image!)
        return personDetailCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            let changeViewBackgroundThread = storyboard?.instantiateViewController(withIdentifier: "ChangeViewBackgroundThread")
                                             as! ChangeViewBackgroundThread
            navigationController?.pushViewController(changeViewBackgroundThread, animated: true)
        }
    }
}
