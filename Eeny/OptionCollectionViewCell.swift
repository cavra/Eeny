//
//  OptionCollectionViewCell.swift
//  Eeny
//
//  Created by Cory Avra on 10/1/16.
//  Copyright © 2016 Cory and Eileen. All rights reserved.
//

import UIKit

class OptionCollectionViewCell: UICollectionViewCell {
    
    // Outlets
    @IBOutlet weak var inputLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        // General
        self.clipsToBounds = true
        //self.layer.masksToBounds = true

        // Corners
        self.layer.cornerRadius = 15
        
        // Shadow
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 15, height: 15)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 15
        
        // Border
        self.layer.borderWidth = 0.2
        self.layer.borderColor = UIColor.black.cgColor
        
    }

}
