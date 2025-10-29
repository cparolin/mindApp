//
//  ColorPickerComponent.swift
//  appMind
//
//  Created by André Contarelli Lima on 22/10/25.
//

import SwiftUI

struct ColorPickerComponent: View {
    @Binding var selectedColor: Color
    @Binding var taskColor: String
    
    let colors: [Color] = [.blue, .red, .yellow, .orange, .purple]
    
    var body: some View {
        VStack {
            HStack(spacing: 8) {
                ForEach(colors, id: \.self) { color in
                    Circle()
                        .fill(color)
                        .frame(width: 54)
                        .background(content: {
                            Circle()
                                .stroke(.blue, lineWidth: 8)
                                .stroke(.white, lineWidth: 4)
                                .opacity(selectedColor == color ? 1 : 0)
                        })
                        .contentShape(.rect)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                selectedColor = color
                                
                            }
                        }
                }
            }
        }
    }
}
