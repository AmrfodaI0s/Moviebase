//
//  PopularPeopleCell.swift
//  Moviebase
//
//  Created by Eslam on 5/28/20.
//  Copyright © 2020 Eslam. All rights reserved.
//

import UIKit

class PopularPeopleCell: UICollectionViewCell {
    
    @IBOutlet weak var iv: UIImageView!
    @IBOutlet weak var personNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        iv.layer.cornerRadius = iv.frame.size.height / 2
    }

}
