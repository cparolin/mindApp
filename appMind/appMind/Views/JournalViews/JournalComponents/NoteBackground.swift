//
//  SwiftUIView.swift
//  appMind
//
//  Created by Dayô Araújo on 22/10/25.
//

import SwiftUI

struct NoteBackground: View {
    var baseColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .stroke(baseColor, lineWidth: 2)
                .fill(baseColor.opacity(0.15))
                
            Rectangle()
                .fill(baseColor)
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
    NoteBackground(baseColor: .blue)
}
