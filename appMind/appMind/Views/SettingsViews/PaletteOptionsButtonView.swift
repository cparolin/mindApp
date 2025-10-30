//
//  PalleteOptionsButtonView.swift
//  appMind
//
//  Created by Camila Parolin on 30/10/25.
//

import SwiftUI

struct PaletteOptionsButtonView: View {
    
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
            
            
//            Spacer()
//                .frame(width: 12)
            
            Text("\(palette)")
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
//                .border(.red)
            
//            Spacer()
//                .frame(width: 200)
            
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
