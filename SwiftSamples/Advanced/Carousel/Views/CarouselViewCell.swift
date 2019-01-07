//
//  CarouselViewCell.swift
//  SwiftSamples
//
//  Created by Tsukasa Hasegawa on 2019/01/04.
//  Copyright © 2019 Tsukasa Hasegawa. All rights reserved.
//

import UIKit

class CarouselViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var cellWidth: CGFloat {
        return self.frame.size.width
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(title: String, color: UIColor) {
        titleLabel.text = title
        self.backgroundColor = color
    }
}
