//
//  TableViewCell.swift
//  TableWithSections
//
//  Created by IosDeveloper on 03/11/17.
//  Copyright © 2017 iOSDeveloper. All rights reserved.
//

import UIKit
    
class TableViewCell: UITableViewCell {

    @IBOutlet var imgViewwidthConstraint: NSLayoutConstraint!
    @IBOutlet var lblArrow: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var imgViewheaderCell: UIImageView!
    //IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ButtonToShowHide: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
