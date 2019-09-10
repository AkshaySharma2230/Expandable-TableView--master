//
//  CustomTableViewCell.swift
//  TableWithSections
//
//  Created by developer on 9/10/19.
//  Copyright © 2019 iOSDeveloper. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var lblText: UILabel!
    @IBOutlet var btnStart: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
