//
//  VariableHeightTable.swift
//  SwiftSamples
//
//  Created by Tsukasa Hasegawa on 2019/02/16.
//  Copyright © 2019 Tsukasa Hasegawa. All rights reserved.
//

struct VariableHeightTable {
    
    enum ContentType: CaseIterable {
        case oneLine
        case twoLines
        case threeLines
    }
    
    static func cellTitle(type: VariableHeightTable.ContentType) -> String {
        switch type {
        case .oneLine:
            return "1列の文字列"
        case .twoLines:
            return "2列の文字列\n2列の文字列"
        case .threeLines:
            return "3列の文字列\n3列の文字列\n3列の文字列"
        }
    }
}
