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
        case badge
    }
    
    static func sectionTitle(section: Top.Sections) -> String {
        switch section {
        case .basic:
            return "Basic"
        case .advanced:
            return "Advanced"
        case .badge:
            return "Badge"
        }
    }
    
    enum BasicCell: CaseIterable {
        case segmentedControl
        case pickerTextField
        case scrollableTextField
        case dateToString
        case wkWebView
        case realTimeObjectTracking
        case overlay
        case escaping
        case variableHeightTable
    }
    
    static func basicCellTitle(cell: Top.BasicCell) -> String {
        switch cell {
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
        case .overlay:
            return "Overlay Menu"
        case .escaping:
            return "@escaping"
        case .variableHeightTable:
            return "Variable Height Table"
        }
    }
    
    enum AdvancedCell: CaseIterable {
        case pagingTabMenu
        case carousel
    }
    
    static func advancedCellTitle(cell: Top.AdvancedCell) -> String {
        switch cell {
        case .pagingTabMenu:
            return "Paging Tab Menu"
        case .carousel:
            return "Carousel"
        }
    }
    
    enum BadgeCell: CaseIterable {
        case barButtonItem
        case tableViewCell
    }
    
    static func badgeCellTitle(cell: Top.BadgeCell) -> String {
        switch cell {
        case .barButtonItem:
            return "UIBarButtonItem + Badge"
        case .tableViewCell:
            return "UITableViewCell + Badge"
        }
    }
}
