//
//  ScrollableTextField.swift
//  SwiftSamples
//
//  Created by Tsukasa Hasegawa on 2018/12/30.
//  Copyright © 2018 Tsukasa Hasegawa. All rights reserved.
//

import UIKit

class ScrollableTextFieldViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var upperTextField: UITextField!
    @IBOutlet weak var lowerTextField: UITextField!
    
    private var activeTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        upperTextField.delegate = self
        lowerTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(self, selector: #selector(ScrollableTextFieldViewController.didReceiveTextFieldShownNotification(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        notificationCenter.addObserver(self, selector: #selector(ScrollableTextFieldViewController.didReceiveTextFieldHiddenNotification(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc private func didReceiveTextFieldShownNotification(_ notification: Notification) {
        let userInfo = notification.userInfo
        let keyboardScreenEndFrame = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let boundsSize = UIScreen.main.bounds.size
        let textLowerY = activeTextField.frame.origin.y + activeTextField.frame.height + 8.0
        let keyboardUpperY = boundsSize.height - keyboardScreenEndFrame.size.height
        print("textLowerY: \(textLowerY)")
        print("keyboardUpperY: \(keyboardUpperY)")
        let statusbarHeight: CGFloat = UIApplication.shared.statusBarFrame.height
        let navigationBarHeight: CGFloat = self.navigationController?.navigationBar.frame.size.height ?? 0.0
        
        if textLowerY >= keyboardUpperY {
            scrollView.contentOffset.y = textLowerY - keyboardUpperY + statusbarHeight + navigationBarHeight
        }
    }
    
    @objc private func didReceiveTextFieldHiddenNotification(_ notification: Notification) {
        scrollView.contentOffset.y = 0
    }
}

extension ScrollableTextFieldViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.activeTextField.resignFirstResponder()
        // self.view.endEditing(true)
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.activeTextField = textField
        return true
    }
}
