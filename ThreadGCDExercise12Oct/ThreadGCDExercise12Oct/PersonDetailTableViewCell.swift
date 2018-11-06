//
//  PersonDetailTableViewCell.swift
//  ThreadGCDExercise12Oct
//
//  Created by Kamaluddin Khan on 14/10/18.
//  Copyright © 2018 Kamaluddin Khan. All rights reserved.
//

import UIKit

class PersonDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var ageLable: UILabel!
    @IBOutlet weak var nameLable: UILabel?
    @IBOutlet weak var imageActivityLoader: UIActivityIndicatorView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
        imageActivityLoader?.startAnimating()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(name:String, age:String, image:UIImage){
        nameLable?.text = name
        ageLable.text = age
        personImage.image = image
    }
    
}
