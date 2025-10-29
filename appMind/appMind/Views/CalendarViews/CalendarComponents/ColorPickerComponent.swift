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
    
    let colors: [Color] = [.blue, .red, .yellow, .orange, .purple, .green]
    
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

#Preview {
    // 1. Defina um estado para simular o Binding da cor selecionada.
    // Usaremos .red como cor inicial.
    @State var selected: Color = .red
    
    // 2. Defina um estado para simular o Binding da string da cor.
    // Iniciaremos com uma string vazia.
    @State var colorString: String = ""

    return ColorPickerComponent(
        // Passa o Binding simulado para a view
        selectedColor: $selected,
        taskColor: $colorString
    )
    .padding() // Adiciona padding para que os círculos não encostem nas bordas
}
