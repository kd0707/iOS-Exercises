//
//  customeTableViewCell.swift
//  TableViewExercise0810
//
//  Created by Kamaluddin Khan on 08/10/18.
//  Copyright © 2018 Kamaluddin Khan. All rights reserved.
//

import UIKit

class customeTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLable: UILabel!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var imgV: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//    func setData(title:String, description:String)  {
//        titleLable.text = title
//        imgV.image = UIImage(named: "ratingstar")
//        descriptionLable.text = description
//    }
    
}
