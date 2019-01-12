//
//  ControlViewCell.swift
//  SwiftSamples
//
//  Created by Tsukasa Hasegawa on 2019/01/12.
//  Copyright © 2019 Tsukasa Hasegawa. All rights reserved.
//

import UIKit

protocol BadgeTableControlCellDelegate: class {
    func didTapIncrease()
    func didTapDecrease()
}

class BadgeTableControlCell: UITableViewCell {
    
    weak var delegate: BadgeTableControlCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func didTapIncreaseButton(_ sender: UIButton) {
        self.delegate?.didTapIncrease()
    }
    
    @IBAction func didTapDecreaseButton(_ sender: UIButton) {
        self.delegate?.didTapDecrease()
    }
}
