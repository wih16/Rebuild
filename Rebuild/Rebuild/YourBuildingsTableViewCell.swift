//
//  YourBuildingsTableViewCell.swift
//  Rebuild
//
//  Created by William Hinard on 10/9/16.
//  Copyright © 2016 William Hinard. All rights reserved.
//

import UIKit

class YourBuildingsTableViewCell: UITableViewCell {

    @IBOutlet weak var yourBuildingNameLabel: UILabel!
    @IBOutlet weak var yourBuildingImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
