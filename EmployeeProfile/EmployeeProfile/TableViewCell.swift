//
//  TableViewCell.swift
//  EmployeeProfile
//
//  Created by Kamaluddin Khan on 01/11/18.
//  Copyright © 2018 Kamaluddin Khan. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameCellLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
