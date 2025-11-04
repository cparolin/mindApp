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
            
        case "Comunicação":
            return "cor2"
            
        case "Vícios":
            return "cor4"
            
        default:
            return "cor1"
        }
    }
    
    private func getColor() -> Color {
        return Color(getPaletteColor(palette: paletteLayout, color: color))
    }
    
    var body: some View {
        NavigationLink {
            NoteAnswersView(journal: journal)
        } label: {
            ZStack {
                // Background
                ReducedItemBackground(journal: journal.journalType.type)
                
                // Date, title and description
                VStack (alignment: .leading){
                    // Month and day
                    HStack {
                        HStack (spacing: 5){
                            Text(journal.date.formatted(day))
                                .bold()
                                .italic()
                            
                            Text(journal.date.formatted(month))
                                .italic()
                        }
                        .padding(.leading, 7)
                        
                        Spacer()
                        
                        VStack (alignment: .trailing, spacing: 2){
                            Text(journal.journalType.type)
                                .font(.caption)
                                .bold()
                                .padding(.trailing, 10)
                            Capsule()
                                .frame(width: 88, height: 2.6)
                                .foregroundStyle(getColor())
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.48)
                    
                    Spacer()
                    // Title
                    Text(journal.title)
                        .font(.title3)
                        .bold()
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 6, trailing: 0))
                }
                .padding(.leading, 6)
                .frame(width: UIScreen.main.bounds.width * 0.46, height: UIScreen.main.bounds.height * 0.095)
            }
        }
        .foregroundStyle(.black)
    }
}

struct ReducedItemBackground: View {
    var journal: String
    @AppStorage("paletteLayout") private var paletteLayout: String = "Saturadas"
    
    var color: String {
        switch journal {
        case "Rotina":
            return "cor1"
            
        case "Comunicação":
            return "cor2"
            
        case "Vícios":
            return "cor4"
            
        default:
            return "cor1"
        }
    }
    
    private func getColor() -> Color {
        return Color(getPaletteColor(palette: paletteLayout, color: color))
    }
    
    let width = UIScreen.main.bounds.width * 0.5
    let height = UIScreen.main.bounds.height * 0.107
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .stroke(getColor(), lineWidth: 2)
                .fill(getColor().opacity(0.15))
                .frame(width: width, height: height)
            
            Rectangle()
                .frame(width: width * 0.46, height: height * 0.35)
                .foregroundStyle(getColor())
                .clipShape(
                    .rect(
                        topLeadingRadius: 16,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 20,
                        topTrailingRadius: 0
                    )
                )
                .offset(x: width * -0.27, y: height * -0.33)
        }
        .padding(.vertical, 5)
    }
}


#Preview {
    ReducedJournalItem(journal: JournalModel(title: "Título", desc: "Lorem Ipsum é simplesmente uma simulação de texto da", date: Date.now, answers: ["",""], journalType: JournalTypeModel(type: "Comunicação", symbol: "message", questions: [""]), isFavorite: false))
}
