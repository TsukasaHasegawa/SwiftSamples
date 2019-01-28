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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
    /*
     * Alertを表示するとUIBarbuttonItemのpropertyであるimageに設定した画像の後ろにバッジが隠れることがあるため
     * Alertを表示する処理を追加
     */
    @IBAction func didTapAlertButton(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Alert", message: "Sample of alert...", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler:{
            (action: UIAlertAction!) -> Void in
            print("OK")
        })
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel, handler:{
            (action: UIAlertAction!) -> Void in
            print("Cancel")
        })
        alertController.addAction(cancelAction)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
}
