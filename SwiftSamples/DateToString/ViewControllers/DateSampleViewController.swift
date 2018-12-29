//
//  DateSampleViewController.swift
//  SwiftSamples
//
//  Created by Tsukasa Hasegawa on 2018/12/29.
//  Copyright © 2018 Tsukasa Hasegawa. All rights reserved.
//

import UIKit

class DateSampleViewController: UIViewController {
    
    @IBOutlet weak var calenderLabel: UILabel!
    @IBOutlet weak var localeLabel: UILabel!
    @IBOutlet weak var calenderLocaleLabel: UILabel!
    @IBOutlet weak var customLabel: UILabel!
    
    var today: Date {
        return Date()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setupLabels() {
        calenderLabel.text = calenderLabelText()
        localeLabel.text = localeLabelText()
        calenderLocaleLabel.text = calenderAndLocaleLabelText()
        customLabel.text = customLabelText()
    }
    
    private func calenderLabelText() -> String {
        return DateConverter.convertWithCalender(from: today)
    }
    
    private func localeLabelText() -> String {
        return DateConverter.convertWithLocale(from: today)
    }
    
    private func calenderAndLocaleLabelText() -> String {
        return DateConverter.convertWithCalenderAndLocale(from: today)
    }
    
    private func customLabelText() -> String {
        return DateConverter.convertWithCustomStyle(from: today)
    }
    
}
