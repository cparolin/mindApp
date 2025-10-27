//
//  FavoriteJournalItem.swift
//  appMind
//
//  Created by Dayô Araújo on 22/10/25.
//

import SwiftUI
import SwiftData

struct FavoriteJournalItem: View {
    var journal: JournalModel
    var baseColor: Color
    
    // month and day date formating
    let month = Date.FormatStyle().month(.abbreviated)
    let day = Date.FormatStyle().day(.twoDigits)
    
    var body: some View {
        NavigationLink {
            NoteCarrouselView(journal: journal.journalType, existingJournal: journal)
        } label: {
            ZStack {
                // Background
                FavoriteItemBackground(baseColor: ColorName.from(name: journal.journalType.color))
                
                // Top right label
                VStack (alignment: .trailing, spacing: 2){
                    Text(journal.journalType.type)
                        .font(.caption)
                        .bold()
                        .padding(.trailing, 10)
                    Capsule()
                        .frame(width: 90, height: 2.6)
                        .foregroundStyle(ColorName.from(name: journal.journalType.color))
                }
                .offset(x: UIScreen.main.bounds.width * 0.162, y: UIScreen.main.bounds.height * -0.035)
                
                // Date, title and description
                VStack (alignment: .leading){
                    // Month and day
                    HStack (spacing: 5){
                        Text(journal.date.formatted(day))
                            .bold()
                            .font(.title3)
                            .italic()
                        
                        Text(journal.date.formatted(month))
                            .font(.title3)
                            .italic()
                        
                        Spacer()
                    }
                    
                    Spacer()
                    // Title
                    Text(journal.title)
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 4)
                }
                .padding(.leading, 8.4)
                .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.1)
            }
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    FavoriteJournalItem(journal: JournalModel(title: "Título", desc: "Lorem Ipsum é simplesmente uma simulação de texto da", date: Date.now, answers: ["",""], journalType: JournalTypeModel(type: "Socialização", color: "azul", symbol: "message", questions: [
        "Onde eu estava e com quem?",
        "O que aconteceu na prática? (Descrição da Situação)",
        "Como eu participei dessa interação e como me senti? (Exemplos: falei bastante, mais escutei do que falei, me senti ansioso)",
        "Resultado real da interação (Exemplos: fiquei satisfeito, houve entendimento mútuo)",
        "O que aprendi ou percebi nessa interação? (Exemplos: funcionou melhor quando fiz perguntas)",
        "O que quero manter ou melhorar para a próxima vez?"
    ]), isFavorite: false), baseColor: .yellow)
}
