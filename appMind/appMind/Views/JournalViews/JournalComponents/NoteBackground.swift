//
//  SwiftUIView.swift
//  appMind
//
//  Created by Dayô Araújo on 22/10/25.
//

import SwiftUI

struct NoteBackground: View {
    var body: some View {
        HStack (spacing: 0){
            Rectangle()
                .foregroundStyle(Color(red: 0.59, green: 0.88, blue: 0.82))
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
                .foregroundStyle(Color(red: 0.18, green: 0.64, blue: 0.55))
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
    NoteBackground()
}
