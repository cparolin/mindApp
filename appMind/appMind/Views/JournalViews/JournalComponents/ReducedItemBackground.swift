//
//  FavoriteItemBackground.swift
//  appMind
//
//  Created by Dayô Araújo on 27/10/25.
//

import SwiftUI

struct ReducedItemBackground: View {
    var baseColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .stroke(baseColor, lineWidth: 2)
                .fill(baseColor.opacity(0.15))
                .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.107)
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width * 0.23, height: UIScreen.main.bounds.height * 0.037)
                .foregroundStyle(baseColor)
                .clipShape(
                    .rect(
                        topLeadingRadius: 16,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 20,
                        topTrailingRadius: 0
                    )
                )
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 61, trailing: 107))
        }
    }
}

#Preview {
    ReducedItemBackground(baseColor: .yellow)
}
