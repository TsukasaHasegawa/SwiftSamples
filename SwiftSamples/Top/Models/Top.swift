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
        case segmentedControl
        case wkWebView
        case facebookLogin
    }
    
    static func basicCellTitle(cell: Top.BasicCell) -> String {
        switch cell {
        case .segmentedControl:
            return "Segmented Control"
        case .wkWebView:
            return "WKWebView"
        case .facebookLogin:
            return "Facebook Login"
        }
    }
    
    enum AdvancedCell: CaseIterable {
        case segmentedTable
    }
    
    static func advancedCellTitle(cell: Top.AdvancedCell) -> String {
        switch cell {
        case .segmentedTable:
            return "Segmented TableView"
        }
    }
}
