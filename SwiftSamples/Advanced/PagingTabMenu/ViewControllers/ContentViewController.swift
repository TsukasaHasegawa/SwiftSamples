//
//  ContentViewController.swift
//  SwiftSamples
//
//  Created by Tsukasa Hasegawa on 2019/01/02.
//  Copyright © 2019 Tsukasa Hasegawa. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    @IBOutlet weak var contentLabel: UILabel!
    
    var index: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let index = index {
            contentLabel.text = PagingMenu.items[index].contentTitle
            view.backgroundColor = PagingMenu.items[index].themeColor
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
