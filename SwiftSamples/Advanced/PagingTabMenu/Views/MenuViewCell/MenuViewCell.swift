//
//  MenuViewCell.swift
//  SwiftSamples
//
//  Created by Tsukasa Hasegawa on 2019/01/02.
//  Copyright © 2019 Tsukasa Hasegawa. All rights reserved.
//

import UIKit

class MenuViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(title: String, color: UIColor, isMovable: Bool) {
        titleLabel.text = title
        titleLabel.backgroundColor = color
        focusCell(isMovable)
    }
    
    func focusCell(_ isMovable: Bool) {
        let color = isMovable ? UIColor.white : UIColor.lightGray
        titleLabel.textColor = color
    }
}
