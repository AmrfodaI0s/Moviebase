//
//  MenuTableViewCell.swift
//  Moviebase
//
//  Created by Eslam on 6/7/20.
//  Copyright © 2020 Eslam. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var iv: UIImageView!
    @IBOutlet weak var genreTypeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
    }
    
}
