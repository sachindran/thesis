//
//  BuildingsTableViewCell.swift
//  Maps
//
//  Created by Sachin Selvaraj on 10/31/16.
//  Copyright © 2016 sachin. All rights reserved.
//

import UIKit

class BuildingsTableViewCell: UITableViewCell {
    
    //MARK: Properties
    
    
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
