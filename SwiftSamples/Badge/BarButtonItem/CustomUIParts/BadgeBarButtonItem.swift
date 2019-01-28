//
//  BadgeBarButtonItem.swift
//  SwiftSamples
//
//  Created by Tsukasa Hasegawa on 2019/01/10.
//  Copyright © 2019 Tsukasa Hasegawa. All rights reserved.
//

import UIKit

class BadgeBarButtonItem: UIBarButtonItem {
    
    private var badge: UILabel?
    var badgeNumber: Int = 0
    
    override init() {
        super.init()
        setupAttributes()
        setupBadge()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupAttributes()
        setupBadge()
    }
    
    private func setupAttributes() {
        self.image = UIImage(named: "menu")
        self.style = .plain
    }
    
    private func setupBadge() {
        /*
         * badgeのx座標を固定値で設定
         * self.widthで値を取得しようとしたけど、この時点では 0 になり、失敗
         * self.value(forKey: "view")でwidthを取得しようとしたけど、失敗
         * 対策を検討中....。
         */
        let label = UILabel(frame: CGRect(x: 30, y: 0, width: 20.0, height: 20.0))
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10.0
        label.clipsToBounds = true
        label.backgroundColor = UIColor.red
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = "\(badgeNumber)"
        label.font = .systemFont(ofSize: 12)
        self.badge = label
    }
    
    func increaseBadge() {
        badgeNumber = badgeNumber + 1
        if badgeNumber >= 99 {
            badgeNumber = 99
        }
        if #available(iOS 11.0, *) {
            updateBadgeOnStackView()
        } else {
            updateBadgeOnUIBarButtonItem()
        }
    }
    
    func decreaseBadge() {
        badgeNumber = badgeNumber - 1
        if badgeNumber <= 0 {
            badgeNumber = 0
        }
        if #available(iOS 11.0, *) {
            updateBadgeOnStackView()
        } else {
            updateBadgeOnUIBarButtonItem()
        }
    }
    
    private func updateBadgeOnUIBarButtonItem() {
        guard let badge = self.badge,
            let view = self.value(forKey: "view") as? UIView else { return }
        if badgeNumber <= 0 {
            self.badge?.removeFromSuperview()
            return
        }
        badge.text = "\(badgeNumber)"
        view.addSubview(badge)
    }
    
    @available(iOS 11, *)
    private func updateBadgeOnStackView() {
        guard let badge = self.badge,
            let view = self.value(forKey: "view") as? UIView else { return }
        if badgeNumber <= 0 {
            self.badge?.removeFromSuperview()
            return
        }
        badge.text = "\(badgeNumber)"
        for subview in view.subviews where subview.isKind(of: UIButton.self){
            subview.addSubview(badge)
        }
    }
}
