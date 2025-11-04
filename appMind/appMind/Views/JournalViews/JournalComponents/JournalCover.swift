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
    
    let coverSize: CGFloat = UIScreen.main.bounds.width * 0.6
    let tabSize: CGFloat = UIScreen.main.bounds.height * 0.02
    
    var color: [String] {
        switch journal.type {
        case "Rotina":
            return ["cor1", "cor1.1", "cor1.2"]
            
        case "Comunicação":
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
                .frame(width: coverSize, height: coverSize)
            
            VStack {
                VStack (spacing: 0){
                    Rectangle()
                        .foregroundColor(Color(getPaletteColor(palette: paletteLayout, color: color[2])))
                        .frame(width: coverSize * 0.8, height: tabSize)
                    
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: coverSize * 0.8, height: tabSize * 1.5)
                        .clipShape(
                            .rect(
                                topLeadingRadius: 0,
                                bottomLeadingRadius: 16,
                                bottomTrailingRadius: 16,
                                topTrailingRadius: 0
                            )
                        )
                        .shadow(color: .black.opacity(0.15), radius: 7, x: 0, y: -1)
                }
                
                Spacer()
                
                VStack (spacing: 12){
                    Text("\(Image(systemName: journal.symbol))")
                        .font(.system(size: 90, weight: .semibold))
                        .innerShadow(Color(getPaletteColor(palette: paletteLayout, color: color[1])))
                    
                    Text(journal.type)
                        .foregroundStyle(Color(getPaletteColor(palette: paletteLayout, color: color[1])))
                        .font(.title)
                        .bold()
                }
                .padding(.bottom)
            }
            .frame(width: coverSize, height: coverSize)
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

extension Text {
    func innerShadow<V: View>(_ background: V, radius: CGFloat = 4, opacity: Double = 0.8) -> some View {
        self
            .foregroundColor(.clear)
            .overlay(background.mask(self).opacity(0.3))
            .overlay(
                ZStack {
                    self.foregroundColor(Color(white: 1.3 - opacity))
                    self.foregroundColor(.white).blur(radius: radius).offset(x: 2, y: 2)
                }
                    .mask(self)
                    .blendMode(.multiply)
            )
    }
}

#Preview {
    JournalCover(journal: JournalTypeModel(type: "Socialização", symbol: "brain.head.profile", questions: [""]))
}
