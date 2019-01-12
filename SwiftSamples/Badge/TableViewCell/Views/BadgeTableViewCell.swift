//
//  BadgeTableViewCell.swift
//  SwiftSamples
//
//  Created by Tsukasa Hasegawa on 2019/01/12.
//  Copyright © 2019 Tsukasa Hasegawa. All rights reserved.
//

import UIKit

class BadgeTableViewCell: UITableViewCell {
    
    private var badge: UILabel?
    var badgeNumber: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupBadge()
    }
    
    private func setupBadge() {
        let label = UILabel()
        label.text = "\(badgeNumber)"
        label.backgroundColor = UIColor.red
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12)
        self.badge = label
    }
    
    func increaseBadge() {
        self.accessoryView = nil
        badgeNumber = badgeNumber + 1
        if badgeNumber >= 99 {
            badgeNumber = 99
        }
        self.badge?.text = "\(badgeNumber)"
        self.badge?.frame = CGRect(x: 0, y: 0, width: 24.0, height: 24.0)
        self.badge?.layer.masksToBounds = true
        self.badge?.layer.cornerRadius = 12.0
        self.accessoryView = self.badge
    }
    
    func decreaseBadge() {
        self.accessoryView = nil
        badgeNumber = badgeNumber - 1
        if badgeNumber <= 0 {
            badgeNumber = 0
            return
        }
        self.badge?.text = "\(badgeNumber)"
        self.badge?.frame = CGRect(x: 0, y: 0, width: 24.0, height: 24.0)
        self.badge?.layer.masksToBounds = true
        self.badge?.layer.cornerRadius = 12.0
        self.accessoryView = self.badge
    }
}
