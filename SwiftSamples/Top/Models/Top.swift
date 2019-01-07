//
//  Top.swift
//  SwiftSamples
//
//  Created by Tsukasa Hasegawa on 2018/12/15.
//  Copyright © 2018 Tsukasa Hasegawa. All rights reserved.
//

struct Top {
    enum Sections: CaseIterable {
        case basic
        case advanced
    }
    
    static func sectionTitle(section: Top.Sections) -> String {
        switch section {
        case .basic:
            return "Basic"
        case .advanced:
            return "Advanced"
        }
    }
    
    enum BasicCell: CaseIterable {
        case accessibilityBoldTextEffect
        case segmentedControl
        case pickerTextField
        case scrollableTextField
        case dateToString
        case wkWebView
        case realTimeObjectTracking
        case facebookLogin
    }
    
    static func basicCellTitle(cell: Top.BasicCell) -> String {
        switch cell {
        case .accessibilityBoldTextEffect:
            return "Prevent Accessibility Bold Text Effect"
        case .segmentedControl:
            return "Segmented Control"
        case .pickerTextField:
            return "Picker TextField"
        case .scrollableTextField:
            return "Scrollable TextField"
        case .dateToString:
            return "Date to String"
        case .wkWebView:
            return "WKWebView"
        case .realTimeObjectTracking:
            return "Real Time Object Tracking"
        case .facebookLogin:
            return "Facebook Login"
        }
    }
    
    enum AdvancedCell: CaseIterable {
        case pagingTabMenu
    }
    
    static func advancedCellTitle(cell: Top.AdvancedCell) -> String {
        switch cell {
        case .pagingTabMenu:
            return "Paging Tab Menu"
        }
    }
}
