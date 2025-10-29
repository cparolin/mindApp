//
//  FavoriteJournalItem.swift
//  appMind
//
//  Created by Dayô Araújo on 22/10/25.
//

import SwiftUI
import SwiftData

struct ReducedJournalItem: View {
    var journal: JournalModel
    @AppStorage("paletteLayout") private var paletteLayout: String = "Saturadas"
    
    // month and day date formating
    let month = Date.FormatStyle().month(.abbreviated)
    let day = Date.FormatStyle().day(.twoDigits)
    
    var color: String {
        switch journal.journalType.type {
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
        NavigationLink {
            NoteCarrouselView(journal: journal.journalType, existingJournal: journal)
        } label: {
            ZStack {
                // Background
                ReducedItemBackground(journal: journal.journalType.type)
                
                // Top right label
                VStack (alignment: .trailing, spacing: 2){
                    Text(journal.journalType.type)
                        .font(.caption)
                        .bold()
                        .padding(.trailing, 10)
                    Capsule()
                        .frame(width: 90, height: 2.6)
                        .foregroundStyle(Color(getPaletteColor(palette: paletteLayout, color: color)))
                }
                .offset(x: UIScreen.main.bounds.width * 0.136, y: UIScreen.main.bounds.height * -0.035)
                
                // Date, title and description
                VStack (alignment: .leading){
                    // Month and day
                    HStack (spacing: 5){
                        Text(journal.date.formatted(day))
                            .bold()
                            .italic()
                        
                        Text(journal.date.formatted(month))
                            .italic()
                        
                        Spacer()
                    }
                    .font(.body)
                    
                    Spacer()
                    // Title
                    Text(journal.title)
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 4)
                }
                .padding(.leading, 6)
                .frame(width: UIScreen.main.bounds.width * 0.46, height: UIScreen.main.bounds.height * 0.095)
            }
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    ReducedJournalItem(journal: JournalModel(title: "Título", desc: "Lorem Ipsum é simplesmente uma simulação de texto da", date: Date.now, answers: ["",""], journalType: JournalTypeModel(type: "Socialização", symbol: "message", questions: [""]), isFavorite: false))
}
