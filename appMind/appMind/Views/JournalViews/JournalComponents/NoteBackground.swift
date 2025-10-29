//
//  SwiftUIView.swift
//  appMind
//
//  Created by Dayô Araújo on 22/10/25.
//

import SwiftUI

struct NoteBackground: View {
    @AppStorage("paletteLayout") private var paletteLayout: String = "Saturadas"
    var journal: String
    
    var color: String {
        switch journal {
        case "Rotina":
            return "cor1"
            
        case "Socialização":
            return "cor2"
            
        case "Vícios":
            return "cor4"
            
        default:
            return "cor não selecionada"
        }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(getPaletteColor(palette: paletteLayout, color: color)), lineWidth: 2)
                .fill(Color(getPaletteColor(palette: paletteLayout, color: color)).opacity(0.15))
                
            Rectangle()
                .fill(Color(getPaletteColor(palette: paletteLayout, color: color)))
                .frame(width: UIScreen.main.bounds.width * 0.135, height: 113)
                .clipShape(
                    .rect(
                        topLeadingRadius: 0,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 16,
                        topTrailingRadius: 16
                    )
                )
                .padding(.leading, UIScreen.main.bounds.width * 0.76)
        }
        .frame(width: UIScreen.main.bounds.width * 0.9, height: 113)
    }
}

#Preview {
    NoteBackground(journal: "Vícios")
}
