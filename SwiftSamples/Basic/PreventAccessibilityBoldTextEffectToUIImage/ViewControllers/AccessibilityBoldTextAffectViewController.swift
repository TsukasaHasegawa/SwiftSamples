//
//  AccessibilityBoldTextAffectViewController.swift
//  SwiftSamples
//
//  Created by Tsukasa Hasegawa on 2019/01/08.
//  Copyright © 2019 Tsukasa Hasegawa. All rights reserved.
//

import UIKit

class AccessibilityBoldTextAffectViewController: UIViewController {
    
    @IBOutlet weak var systemButton: UIButton!
    @IBOutlet weak var customButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }
    
    private func setupButtons() {
        /*
         * StoryBoardでButtonのTypeをSystemに設定していると画像自体が太くなる現象が発生した。Customに設定することで、画像はもとのデザインで表示された。
         * 今、上手く再現できていないので、また今度。
         */
        systemButton.setTitle("", for: .normal)
        systemButton.setImage(UIImage(named: "maskman"), for: .normal)
        systemButton.tintColor = UIColor.orange
        
        
        customButton.setTitle("", for: .normal)
        customButton.setImage(UIImage(named: "maskman"), for: .normal)
        customButton.tintColor = UIColor.orange
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
