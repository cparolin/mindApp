//
//  JournalItem.swift
//  appMind
//
//  Created by Dayô Araújo on 20/10/25.
//

import SwiftUI
import SwiftData

struct JournalItem: View {
    @Environment(\.modelContext) private var context
    
    var journal: JournalModel
    
    let month = Date.FormatStyle().month(.abbreviated)
    let day = Date.FormatStyle().day(.twoDigits)
    
    var body: some View {
        NavigationLink {
            NoteCarrouselView(journal: journal.journalType, existingJournal: journal)
            
        } label: {
            ZStack {
                NoteBackground(journal: journal.journalType.type)
                
                HStack (spacing: -3){
                    HStack {
                        VStack (spacing: 9){
                            Text(journal.date.formatted(month))
                                .font(.title3)
                                .fontWeight(.semibold)
                            
                            Text(journal.date.formatted(day))
                                .font(.title)
                        }
                        
                        VStack (alignment: .leading, spacing: 9){
                            Text(journal.title)
                                .font(.title3)
                                .fontWeight(.semibold)
                            
                            Text(journal.desc)
                                .font(.callout)
                                .multilineTextAlignment(.leading)
                                .frame(width: UIScreen.main.bounds.width * 0.63, alignment: .topLeading)
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.69)
                    }.padding(.leading, 3)
                    
                    Button {
                        journal.isFavorite.toggle()
                        try? context.save()
                        
                    } label: {
                        if journal.isFavorite {
                            Image(systemName: "heart.fill")
                        }
                        else {
                            Image(systemName: "heart")
                        }
                    }
                    .offset(x: UIScreen.main.bounds.width * -0.015, y: UIScreen.main.bounds.height * -0.04)
                }
                .foregroundStyle(.black)
                .padding(.horizontal, 20)
                .padding(.vertical, 20)
            }
        }
    }
}

struct NoteBackground: View {
    @AppStorage("paletteLayout") private var paletteLayout: String = "Saturadas"
    var journal: String
    
    var color: String {
        switch journal {
        case "Rotina":
            return "cor1"
            
        case "Socialização":
            return "cor2"
            
        case "Vícios":
            return "cor4"
            
        default:
            return "cor não selecionada"
        }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(getPaletteColor(palette: paletteLayout, color: color)), lineWidth: 2)
                .fill(Color(getPaletteColor(palette: paletteLayout, color: color)).opacity(0.15))
                
            Rectangle()
                .fill(Color(getPaletteColor(palette: paletteLayout, color: color)))
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
