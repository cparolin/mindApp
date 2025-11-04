//
//  OffsetKey.swift
//  appMind
//
//  Created by André Contarelli Lima on 03/11/25.
//

import SwiftUI

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 16
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
