//
//  OverlayMenuViewController.swift
//  SwiftSamples
//
//  Created by Tsukasa Hasegawa on 2019/01/28.
//  Copyright © 2019 Tsukasa Hasegawa. All rights reserved.
//

import UIKit

class OverlayMenuViewController: UIViewController {
    
    @IBOutlet weak var menuView: UIView!
    
    private var width: CGFloat {
        return 250.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        menuView.layer.position.x = -width
        showMenu()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        for touch in touches {
            if touch.view?.tag == 1 {
                hideMenu()
            }
        }
    }
    
    private func showMenu() {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: .curveEaseOut,
                       animations: {
                           self.menuView.layer.position.x = 0
                       },
                       completion: { bool in
                       })
    }
    
    private func hideMenu() {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: .curveEaseIn,
                       animations: {
                           self.menuView.layer.position.x = -self.menuView.frame.width
                       },
                       completion: { bool in
                           self.dismiss(animated: true, completion: nil)
                       })
    }
    
}
