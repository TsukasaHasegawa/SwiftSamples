//
//  EscapingRefererViewController.swift
//  SwiftSamples
//
//  Created by Tsukasa Hasegawa on 2019/02/02.
//  Copyright © 2019 Tsukasa Hasegawa. All rights reserved.
//

import UIKit

class EscapingRefererViewController: UIViewController {
    
    private var refered: EscapingRefered?
    var count = 0
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refered = EscapingRefered(closure: { [weak self] in
            self?.count += 1
        })
        label.text = "\(count)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didTapIncreseButton(_ sender: UIButton) {
        refered?.storedClosure()
        label.text = "\(count)"
    }
}
