//
//  ColorPickerComponent.swift
//  appMind
//
//  Created by André Contarelli Lima on 22/10/25.
//

import SwiftUI

struct ColorPickerComponent: View {
    @Binding var taskColor: String
    
    let palette: String
    
    var body: some View {
        VStack {
            HStack(spacing: 8) {
                ForEach(Array(PalettesButton[palette]!.keys).sorted(), id: \.self) { color in
                    Circle()
                        .foregroundStyle(Color(getPaletteColorButton(palette: palette, color: color)))
                        .frame(width: 54)
                        .background(content: {
                            Circle()
                                .stroke(.blue, lineWidth: 8)
                                .stroke(.white, lineWidth: 4)
                                .opacity(taskColor == color ? 1 : 0)
                        })
                        .contentShape(.rect)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                taskColor = color
                                
                            }
                        }
                }
            }
        }
    }
}
