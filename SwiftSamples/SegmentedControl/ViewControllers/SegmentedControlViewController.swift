//
//  SegmentedControlViewController.swift
//  SwiftSamples
//
//  Created by Tsukasa Hasegawa on 2018/12/20.
//  Copyright © 2018 Tsukasa Hasegawa. All rights reserved.
//

import UIKit

class SegmentedControlViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setupSubviews() {
        segmentedControl.selectedSegmentIndex = 0
        self.label.text = "First"
        self.label.backgroundColor = UIColor.red
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.label.text = "First"
            self.label.backgroundColor = UIColor.red
        case 1:
            self.label.text = "Second"
            self.label.backgroundColor = UIColor.green
        case 2:
            self.label.text = "Third"
            self.label.backgroundColor = UIColor.blue
        default:
            break
        }
    }
}
