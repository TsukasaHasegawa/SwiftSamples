//
//  EscapingRefered.swift
//  SwiftSamples
//
//  Created by Tsukasa Hasegawa on 2019/02/02.
//  Copyright © 2019 Tsukasa Hasegawa. All rights reserved.
//

class EscapingRefered {
    
    let storedClosure: () -> ()
    
    init(closure: @escaping () -> ()) {
        storedClosure = closure
    }
}
