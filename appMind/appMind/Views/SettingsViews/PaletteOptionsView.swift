//
//  PalleteOptionsView.swift
//  appMind
//
//  Created by Camila Parolin on 27/10/25.
//

import SwiftUI

struct PaletteOptionsView: View {
    @AppStorage("paletteLayout") private var paletteLayout: String = "Saturadas"
    @Environment(\.dismiss) var dismiss
    
    let columns = [
        GridItem(.fixed(180)),
        GridItem(.fixed(180))
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                LazyVGrid(columns: columns, spacing: 30) {
                    ForEach(Array(Palettes.keys.sorted()), id: \.self) { number in
                        Button {
                            paletteLayout = number
                            print("jjknknjk")
                        } label: {
                            VStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 16)
                                        .foregroundStyle(Color.white)
                                        .frame(width: 170, height: 145)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 16)
                                                .stroke(Color.accentColor, lineWidth: 4)
                                                .opacity(paletteLayout == number ? 1 : 0)
                                        )
                                    
                                    VStack {
                                        PaletteButton(palette: number)
                                        
                                        Text(number)
                                            .foregroundStyle(Color.black)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Paleta de Cores")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Text("OK")
                    }
                }
            }
        }
    }
}

#Preview {
    PaletteOptionsView()
}
