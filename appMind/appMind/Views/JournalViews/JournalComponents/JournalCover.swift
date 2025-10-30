//
//  JournalCover.swift
//  appMind
//
//  Created by Dayô Araújo on 27/10/25.
//

import SwiftUI

struct JournalCover: View {
    var journal: JournalTypeModel
    @AppStorage("paletteLayout") private var paletteLayout: String = "Saturadas"
    
    var color: [String] {
        switch journal.type {
        case "Rotina":
            return ["cor1", "cor1.1", "cor1.2"]
            
        case "Socialização":
            return ["cor2", "cor2.1", "cor2.2"]
            
        case "Vícios":
            return ["cor4", "cor4.1", "cor4.2"]
            
        default:
            return []
        }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(Color(getPaletteColor(palette: paletteLayout, color: color[0])))
                .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.width * 0.6)
            
            Rectangle()
                .foregroundColor(Color(getPaletteColor(palette: paletteLayout, color: color[2])))
                .frame(width: UIScreen.main.bounds.width * 0.48, height: UIScreen.main.bounds.height * 0.02)
                .padding(.bottom, UIScreen.main.bounds.height * 0.257)
            
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
                .padding(.bottom, UIScreen.main.bounds.height * 0.218)
            
            VStack (spacing: 12){
                Text("\(Image(systemName: journal.symbol))")
                    .font(.system(size: 90, weight: .medium))
                    .innerShadow(Color(getPaletteColor(palette: paletteLayout, color: color[1])))
                
                Text(journal.type)
                    .foregroundStyle(Color(getPaletteColor(palette: paletteLayout, color: color[1])))
                    .font(.title)
                    .bold()
            }
            .padding(.top, 25)
        }
    }
}

struct JournalCoverScroll: View {
    var journals: [JournalTypeModel]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack (spacing: 25){
                ForEach(journals) { journal in
                    NavigationLink {
                        JournalListView(journalType: journal)
                    } label: {
                        JournalCover(journal: journal)
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    JournalCover(journal: JournalTypeModel(type: "Socialização", symbol: "arrow.trianglehead.clockwise", questions: [""]))
}
