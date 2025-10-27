//
//  FavoriteItemBackground.swift
//  appMind
//
//  Created by Dayô Araújo on 27/10/25.
//

import SwiftUI

struct FavoriteItemBackground: View {
    var baseColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .stroke(baseColor, lineWidth: 2)
                .fill(baseColor.opacity(0.15))
                .frame(width: UIScreen.main.bounds.width * 0.55, height: UIScreen.main.bounds.height * 0.12)
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width * 0.27, height: UIScreen.main.bounds.height * 0.046)
                .foregroundStyle(baseColor)
                .clipShape(
                    .rect(
                        topLeadingRadius: 16,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 16,
                        topTrailingRadius: 0
                    )
                )
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 65, trailing: 111))
        }
    }
}

#Preview {
    FavoriteItemBackground(baseColor: .yellow)
}
