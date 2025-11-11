//
//  PaletteButton.swift
//  appMind
//
//  Created by Camila Parolin on 28/10/25.
//

import SwiftUI

struct PaletteButton: View {
    let columns = [
        GridItem(.fixed(35), spacing: 12),
        GridItem(.fixed(35), spacing: 12),
        GridItem(.fixed(35), spacing: 12),
    ]
    let palette: String
    
    var body: some View {
        VStack {
            LazyVGrid(columns: columns, spacing: 5) {
                ForEach(Array(PalettesButton[palette]!.keys).sorted(), id: \.self) { color in
                    Circle()
                        .frame(width: 43)
                        .foregroundStyle(Color(getPaletteColorButton(palette: palette, color: color)))
                }
            }
        }
    }
}

#Preview {
    PaletteButton(palette: "Suaves")
}
