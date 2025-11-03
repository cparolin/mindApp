//
//  NoteAnswersView.swift
//  appMind
//
//  Created by Dayô Araújo on 30/10/25.
//

import SwiftUI

struct NoteAnswersView: View {
    var journal: JournalModel
    var list: [Int] = [0, 1, 2, 3, 4, 5]
    
    @AppStorage("paletteLayout") private var paletteLayout: String = "Saturadas"
    
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
    
    private func getColor() -> Color {
        return Color(getPaletteColor(palette: paletteLayout, color: color))
    }
    
    var body: some View {
        ScrollView {
            TitleBanner(journal: journal)
                .padding(.trailing, UIScreen.main.bounds.width * 0.1)
            
            VStack (alignment: .leading, spacing: 25){
                Text(journal.desc)
                    .bold()
                
                HStack {
                    Text("Data do Registro")
                    Spacer()
                    Text(journal.date, format: .dateTime.day().month().year())
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(getColor(), lineWidth: 2)
                        .fill(getColor().opacity(0.3))
                )
                
                ForEach (list, id: \.self) { index in
                    VStack (alignment: .leading, spacing: 5){
                        Text(journal.journalType.questions[index])
                            .font(.callout)
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                        
                        Text(journal.answers[index])
                    }
                }
                
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    NavigationLink {
                        NoteCarrouselView(journal: journal.journalType, existingJournal: journal)
                    } label: {
                        Image(systemName: "pencil.line")
                    }
                }
            }
            .toolbarBackground(.hidden, for: .navigationBar)
            .padding(EdgeInsets(top: 20, leading: 23, bottom: 0, trailing: 23))
        }
        .ignoresSafeArea()
    }
}

struct TitleBanner: View {
    var journal: JournalModel
    
    @AppStorage("paletteLayout") private var paletteLayout: String = "Saturadas"
    
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
    
    private func getColor() -> Color {
        return Color(getPaletteColor(palette: paletteLayout, color: color))
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.22)
                .foregroundStyle(getColor())
                .clipShape(
                    .rect(
                        topLeadingRadius: 0,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 225,
                        topTrailingRadius: 0
                    )
                )
                .ignoresSafeArea()
            
            Text(journal.title)
                .font(.largeTitle)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .offset(y: UIScreen.main.bounds.height * 0.06)
        }
    }
}

#Preview {
    NoteAnswersView(journal: JournalModel(title: "Título", desc: "Lorem Ipsum é simplesmente uma simulação de texto da", date: Date.now, answers: ["Não fiz Nada","aaa","aa","aaa","aaa","aaa",], journalType: JournalTypeModel(type: "Rotina", symbol: "arrow.trianglehead.clockwise", questions: [
        "O que fiz hoje na minha rotina?",
        "Houve algo que me deixou confortável ou feliz?",
        "Houve algo que me incomodou?",
        "Como eu me senti e o que pensei sobre esse incômodo?",
        "O que funcionou bem na minha rotina?",
        "O que eu gostaria de ajustar para lidar com os incômodos da próxima vez?"
    ]), isFavorite: false))
}
