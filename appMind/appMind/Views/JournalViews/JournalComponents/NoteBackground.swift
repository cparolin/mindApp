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
        HStack (spacing: 0){
            Rectangle()
                .foregroundStyle(baseColor.opacity(0.40))
                .frame(width: UIScreen.main.bounds.width * 0.77, height: 113)
                .clipShape(
                    .rect(
                        topLeadingRadius: 16,
                        bottomLeadingRadius: 16,
                        bottomTrailingRadius: 0,
                        topTrailingRadius: 0
                    )
                )
                
            Rectangle()
                .foregroundStyle(baseColor)
                .frame(width: UIScreen.main.bounds.width * 0.135, height: 113)
                .clipShape(
                    .rect(
                        topLeadingRadius: 0,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 16,
                        topTrailingRadius: 16
                    )
                )
        }
        .shadow(color: .black.opacity(0.09), radius: 4.1, x: 0, y: 1)
    }
}

#Preview {
    NoteBackground(baseColor: .blue)
}
