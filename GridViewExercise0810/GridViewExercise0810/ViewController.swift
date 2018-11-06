//
//  ViewController.swift
//  GridViewExercise0810
//
//  Created by Kamaluddin Khan on 09/10/18.
//  Copyright © 2018 Kamaluddin Khan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var nameArray = ["Aman","Kamal","Kamaluddin","Barat","Chimwal","Deepak","Elina","Fiza","Gudiya","Harish","Ikjam","Jubair","Ameena","Manu","Rohan","Jabbar","Pravin","Chakresh","Gupta","Yasir","Ajay","Harish","Rakes"]
    var favSport = ["Cricket","Chess","Football","Volleyball","Cricket","Chess","Football","Volleyball","Cricket","Chess","Football","Volleyball","Cricket","Chess","Football","Volleyball","Cricket","Chess","Football","Volleyball","Cricket","Chess","Football","Volleyball","Volleyball"]
    var prImage:[UIImage] = [UIImage(named: "rupee1")!,UIImage(named: "profile _icon")!,UIImage(named: "rupee1")!,UIImage(named: "profile _icon")!,UIImage(named: "profile _icon")!,UIImage(named: "rupee2")!,UIImage(named: "profile _icon")!,UIImage(named: "rupee3")!,UIImage(named: "profile _icon")!,UIImage(named: "profile _icon")!,UIImage(named: "rupee1")!,UIImage(named: "profile _icon")!,UIImage(named: "rupee1")!,UIImage(named: "profile _icon")!,UIImage(named: "rupee1")!,UIImage(named: "profile _icon")!,UIImage(named: "profile _icon")!,UIImage(named: "rupee2")!,UIImage(named: "profile _icon")!,UIImage(named: "rupee3")!,UIImage(named: "profile _icon")!,UIImage(named: "profile _icon")!,UIImage(named: "rupee1")!,UIImage(named: "profile _icon")!,UIImage(named: "profile _icon")!]
   
    
    let cellName = "CollectionViewCell"

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 30
        flowLayout.minimumInteritemSpacing = 20
        collectionView.collectionViewLayout = flowLayout
       
        let nib = UINib(nibName: cellName, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellName)
        
        let nibHeader = UINib(nibName: "HeaderForCollection", bundle: nil)
        
        collectionView.register(nibHeader, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderForCollection")
        
        let nibFooter = UINib(nibName: "CollectionFooter", bundle: nil)
        
        collectionView.register(nibFooter, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "CollectionFooter")
        
        

        
     
       
    }
    
    func getNumberofRowInSection(character:Int) -> Int{
        let character = (UnicodeScalar(character)?.description)!
        var count = 0
        for name in nameArray{
            if name.prefix(1) == character{
                count += 1
            }
        }
        return count
    }
    
    func getIndex(character:Int) -> [Int] {
        let character = (UnicodeScalar(character)?.description)!
        var indexArray:[Int] = []
        for index in 0..<nameArray.count{
            if nameArray[index].prefix(1) == character{
                indexArray.append(index)
            }
        }
        return indexArray
    }

}

extension ViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
   
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 26
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        

        var x:Int = 0
        for character in 65...90{
            if section == character - 65{
                x = getNumberofRowInSection(character: character)
            }
        }
        
        return x
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellName, for: indexPath) as! CollectionViewCell
        
        var indexArray:[Int] = []
        let section:Int = indexPath.section
        for i in 65...90{
            if section == i - 65 {
               indexArray = getIndex(character: i)
            }
        }
       
        for j in indexArray {
             print("Check",indexArray)
            cell.lbl.text = nameArray[j]
            cell.prflImage.image = prImage[j]
            cell.favLbl.text = favSport[j]
             return cell
        }
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
        //return CGSize.init(width: UIScreen.main.bounds.width - 20, height: 80)
        return CGSize.init(width:UIScreen.main.bounds.width - 8, height:100)// Manages size of items
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView{
        if kind == UICollectionView.elementKindSectionHeader{
        let headerOfCollection = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderForCollection", for: indexPath) as! HeaderForCollection
            print(indexPath)
            
            let section:Int = indexPath.section
            for i in 65...90{
                if section == i - 65 {
                headerOfCollection.headerLable.text = UnicodeScalar(i)?.description
                }
                
            }
            
        
     headerOfCollection.frame.size.width = UIScreen.main.bounds.width

        return headerOfCollection
        }
//        if kind == UICollectionView.elementKindSectionFooter{
//
//            let f = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "CollectionFooter", for: indexPath)
//            return f
//        }
        return UICollectionReusableView()
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 40)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        return CGSize(width: collectionView.frame.width, height: 40)
//    }
    
}

