//
//  MMMultTableCollectionViewCell.swift
//  Mental Math Trainer
//
//  Created by Fabricio Machado on 6/5/17.
//  Copyright © 2017 Fabricio Machado. All rights reserved.
//

import UIKit

class MMMultTableCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var multResultLabel: UILabel!
    @IBOutlet weak var correctIndicator: UILabel!
    @IBOutlet weak var incorrectIndicator: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
