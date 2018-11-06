//
//  GridAndLIstViewController.swift
//  GridViewExercise0810
//
//  Created by Kamaluddin Khan on 10/10/18.
//  Copyright © 2018 Kamaluddin Khan. All rights reserved.
//

import UIKit

class GridAndLIstViewController: UIViewController {
    let cellName = "CollectionViewCell"
    var flag = 0
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    @IBOutlet weak var changeViewButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: cellName, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellName)
         changeViewButton.setBackgroundImage(UIImage(named: "list"), for: .normal)

        // Do any additional setup after loading the view.
    }

    //MARK:- Change View Action
    @IBAction func chageViewGridAndListAction(_ sender: UIButton) {
        if(flag == 0){
            collectionView.reloadData()
            flag = 1
            sender.setBackgroundImage(UIImage(named: "grid"), for: .normal)
        }
        else{
            collectionView.reloadData()
            sender.setBackgroundImage(UIImage(named: "list"), for: .normal)
            flag = 0
        }
    }
}


//MARK:- Collection View Delegate and Data Source
extension GridAndLIstViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellName, for: indexPath) as! CollectionViewCell
        
       return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = 20    // Leaves space from top & bottom
        return UIEdgeInsets(top: CGFloat(inset), left: CGFloat(inset), bottom: CGFloat(inset), right: CGFloat(inset))
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width/2 - 30
        //return CGSize.init(width: UIScreen.main.bounds.width - 20, height: 80)
        if(flag == 0){
        return CGSize.init(width:width, height:100)// Manages size of items
        }
        else{
        return CGSize.init(width: UIScreen.main.bounds.width - 20, height:100)
        }
       
    }
}


