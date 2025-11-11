//
//  PalleteOptionsButtonView.swift
//  appMind
//
//  Created by Camila Parolin on 30/10/25.
//

import SwiftUI

struct PaletteOptionsButtonView: View {
    @AppStorage("font") private var font = "SF Pro"
    let palette: String
    
    var body: some View {
        HStack {
            ForEach(Array(PalettesButton[palette]!.keys).sorted(), id: \.self) { color in
                Circle()
                    .frame(width: 12)
                    .foregroundStyle(Color(getPaletteColorButton(palette: palette, color: color)))
                
                Spacer()
                    .frame(width: 2)
            }
            
            Text("\(palette)")
                .font(.changeFont(fontType: font, fontStyle: .body, fontWeight: .regular))
                .foregroundStyle(.text)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            Image(systemName: "chevron.right")
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity, alignment: .trailing)
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    PaletteOptionsButtonView(palette: "Suaves")
}
