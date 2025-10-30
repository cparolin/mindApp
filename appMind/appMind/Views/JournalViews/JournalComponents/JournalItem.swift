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
            NoteAnswersView(journal: journal)
            
        } label: {
            ZStack {
                NoteBackground(journal: journal.journalType.type)
                
                HStack (spacing: 22){
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
                            .frame(width: UIScreen.main.bounds.width * 0.53, alignment: .topLeading)
                    }
                    
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
                    .offset(x: UIScreen.main.bounds.width * 0.02, y: UIScreen.main.bounds.height * -0.04)   
                }
                .foregroundStyle(.black)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    JournalItem(journal: JournalModel(title: "Título", desc: "Lorem Ipsum é simplesmente uma simulação de texto da", date: Date.now, answers: ["Não fiz Nada","aaa","aa","aaa","aaa","aaa",], journalType: JournalTypeModel(type: "Rotina", symbol: "arrow.trianglehead.clockwise", questions: [
        "O que fiz hoje na minha rotina?",
        "Houve algo que me deixou confortável ou feliz?",
        "Houve algo que me incomodou?",
        "Como eu me senti e o que pensei sobre esse incômodo?",
        "O que funcionou bem na minha rotina?",
        "O que eu gostaria de ajustar para lidar com os incômodos da próxima vez?"
    ]), isFavorite: false))
}

struct NoteBackground: View {
    @AppStorage("paletteLayout") private var paletteLayout: String = "Saturadas"
    var journal: String
    
    let width = UIScreen.main.bounds.width * 0.88
    let height: CGFloat = 113
    
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
    
    private func getColor() -> Color {
        return Color(getPaletteColor(palette: paletteLayout, color: color))
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .stroke(getColor(), lineWidth: 2)
                .fill(getColor().opacity(0.15))
            
            Rectangle()
                .fill(getColor())
                .frame(width: width * 0.14, height: height)
                .clipShape(
                    .rect(
                        topLeadingRadius: 0,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 16,
                        topTrailingRadius: 16
                    )
                )
                .padding(.leading, width * 0.855)
        }
        .frame(width: width, height: height)
    }
}
