//
//  View+Extensions.swift
//  TodoPOC
//
//  Created by André Contarelli Lima on 06/10/25.
//

import SwiftUI

extension View {
    
    /// Spacers customizados
    func hSpacing(_ alignment: Alignment) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    func vSpacing(_ alignment: Alignment) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
    
    /// Checando se duas datas são as mesmas
    func isSameDate(_ data1: Date, _ data2: Date) -> Bool {
        return Calendar.current.isDate(data1, inSameDayAs: data2)
    }
}
