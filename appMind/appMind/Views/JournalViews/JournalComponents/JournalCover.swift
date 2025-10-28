//
//  JournalCover.swift
//  appMind
//
//  Created by Dayô Araújo on 27/10/25.
//

import SwiftUI

struct JournalCover: View {
    var journal: JournalTypeModel
    var baseColor: Color
    var secondaryColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(baseColor)
                .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.width * 0.6)
            
            Rectangle()
                .foregroundColor(secondaryColor)
                .frame(width: UIScreen.main.bounds.width * 0.48, height: UIScreen.main.bounds.height * 0.02)
                .padding(.bottom, UIScreen.main.bounds.height * 0.256)
            
            Rectangle()
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width * 0.48, height: UIScreen.main.bounds.height * 0.02)
                .clipShape(
                    .rect(
                        topLeadingRadius: 0,
                        bottomLeadingRadius: 16,
                        bottomTrailingRadius: 16,
                        topTrailingRadius: 0
                    )
                )
                .shadow(color: .black.opacity(0.15), radius: 7, x: 0, y: -1)
                .padding(.bottom, UIScreen.main.bounds.height * 0.215)
            
            VStack (spacing: 12){
                Text("\(Image(systemName: journal.symbol))")
                    .font(.system(size: 90, weight: .medium))
                    .innerShadow(Color(secondaryColor))
                
                Text(journal.type)
                    .foregroundStyle(.black)
                    .font(.title2)
                    .bold()
            }
            .padding(.top, 25)
        }
    }
}

#Preview {
    JournalCover(journal: JournalTypeModel(type: "Socialização", color: "amarelo", secondaryColor: "laranja", symbol: "arrow.trianglehead.clockwise", questions: [""]), baseColor: .orange, secondaryColor: .red)
}
