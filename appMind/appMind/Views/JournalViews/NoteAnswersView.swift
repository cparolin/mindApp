//
//  NoteAnswersView.swift
//  appMind
//
//  Created by Dayô Araújo on 30/10/25.
//

import SwiftUI
import SwiftData

struct NoteAnswersView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    @State var presentConfirmation: Bool = false
    
    var journal: JournalModel
    var list: [Int] = [0, 1, 2, 3, 4, 5]
    
    @AppStorage("font") private var font = "SF Pro"
    @AppStorage("paletteLayout") private var paletteLayout: String = "Saturadas"
    
    var color: String {
        switch journal.journalType.type {
        case "Rotina":
            return "cor1"
            
        case "Comunicação":
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
                .padding(.trailing, UIScreen.main.bounds.width * 0.02)
            
            VStack (alignment: .leading, spacing: 25){
                Text(journal.desc)
                    .font(.changeFont(fontType: font, fontStyle: .body, fontWeight: .bold))
                
                HStack {
                    Text("Data do Registro")
                        .font(.changeFont(fontType: font, fontStyle: .body, fontWeight: .regular))
                    Spacer()
                    Text(journal.date, format: .dateTime.day().month().year())
                        .font(.changeFont(fontType: font, fontStyle: .body, fontWeight: .regular))
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
                            .font(.changeFont(fontType: font, fontStyle: .callout, fontWeight: isOpenDyslexic(font: font) ? .bold : .semibold))
                            .foregroundStyle(.gray)
                        
                        Text(journal.answers[index])
                            .font(.changeFont(fontType: font, fontStyle: .body, fontWeight: .regular))
                    }
                }
                
                Button(role: .destructive){
                    presentConfirmation.toggle()
                } label: {
                    Text("Excluir Registro")
                        .font(.changeFont(fontType: font, fontStyle: .subheadline, fontWeight: isOpenDyslexic(font: font) ? .bold : .semibold))
                        .hSpacing(.center)
                }
                .confirmationDialog("Você tem certeza que deseja excluir esse evento ?", isPresented: $presentConfirmation , titleVisibility: .visible){
                    Button("Sim" , role: .destructive){
                       context.delete(journal)
                        do {
                            try context.save()
                        } catch let error{
                            print(error.localizedDescription)
                        }
                        dismiss()
                    }
                }
                
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
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
                }
                
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
    
    @AppStorage("font") private var font = "SF Pro"
    @AppStorage("paletteLayout") private var paletteLayout: String = "Saturadas"
    
    var color: String {
        switch journal.journalType.type {
        case "Rotina":
            return "cor1"
            
        case "Comunicação":
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
                .frame(width: UIScreen.main.bounds.width * 0.98, height: UIScreen.main.bounds.height * 0.22)
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
                .font(.changeFont(fontType: font, fontStyle: .largeTitle, fontWeight: .bold))
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
