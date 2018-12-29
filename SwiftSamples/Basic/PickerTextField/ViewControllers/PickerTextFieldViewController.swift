//
//  PickerTextFieldViewController.swift
//  SwiftSamples
//
//  Created by Tsukasa Hasegawa on 2018/12/30.
//  Copyright © 2018 Tsukasa Hasegawa. All rights reserved.
//

import UIKit

class PickerTextFieldViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setupTextField() {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 0, height: 35))
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(PickerTextFieldViewController.done))
        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(PickerTextFieldViewController.cancel))
        toolbar.setItems([cancelItem, doneItem], animated: true)
        textField.inputView = pickerView
        textField.inputAccessoryView = toolbar
    }
    
    @objc private func done() {
        self.textField.endEditing(true)
    }
    
    @objc private func cancel() {
        self.textField.text = ""
        self.textField.endEditing(true)
    }
}

extension PickerTextFieldViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return BirthMonth.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return BirthMonth.allCases[row].rawValue
    }
}

extension PickerTextFieldViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.textField.text = BirthMonth.allCases[row].rawValue
    }
}
