//
//  BadgeBarButtonItemViewController.swift
//  SwiftSamples
//
//  Created by Tsukasa Hasegawa on 2019/01/10.
//  Copyright © 2019 Tsukasa Hasegawa. All rights reserved.
//

import UIKit

class BadgeBarButtonItemViewController: UIViewController {
    
    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var decreaseButton: UIButton!
    
    private var barButtonItem: BadgeBarButtonItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBarButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setupBarButtonItem() {
        let barButtonItem = BadgeBarButtonItem()
        self.barButtonItem = barButtonItem
        self.navigationItem.leftBarButtonItem = self.barButtonItem
    }
    
    @IBAction func didTapIncreaseButton(_ sender: UIButton) {
        self.barButtonItem?.increaseBadge()
    }
    
    @IBAction func didTapDecreaseButton(_ sender: UIButton) {
        self.barButtonItem?.decreaseBadge()
    }
}
