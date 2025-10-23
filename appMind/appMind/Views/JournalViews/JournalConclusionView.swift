//
//  JournalConclusionView.swift
//  appMind
//
//  Created by Dayô Araújo on 21/10/25.
//

import SwiftUI
import SwiftData

struct JournalConclusionView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    var existingJournal: JournalModel?
    var journalType: JournalTypeModel
    var answers: [String]
    
    @State private var title: String = ""
    @State private var desc: String = ""
    @State private var date: Date = Date.now
    
    init(existingJournal: JournalModel? = nil, journalType: JournalTypeModel, answers: [String]) {
        self.existingJournal = existingJournal
        self.journalType = journalType
        self.answers = answers
        
        _title = State(initialValue: existingJournal?.title ?? "")
        _desc = State(initialValue: existingJournal?.desc ?? "")
        _date = State(initialValue: existingJournal?.date ?? Date.now)
    }
    
    func createNote() {
        if let existing = existingJournal {
            existing.title = title
            existing.desc = desc
            existing.date = date
            existing.answers = answers
        } else {
            let newNote = JournalModel(title: title, desc: desc, date: date, answers: answers, journalType: journalType, isFavorite: false)
            context.insert(newNote)
        }
        
        dismiss()
    }
    
    var body: some View {
        VStack (spacing: 8){
            TextField("Título do Registro", text: $title)
                .font(.title2)
                .bold()
                .padding(.bottom, 10)
            
            TextField("Descrição Breve", text: $desc, axis: .vertical)
                .fontWeight(.semibold)
                .limitInputLength(value: $desc, length: 50)
            
            Divider()
                .padding(.top, 4)
            
            DatePicker("Data do Registro", selection: $date, displayedComponents: .date)
                .padding(.top, 15)
            
            Spacer()
        }
        .padding(EdgeInsets(top: 30, leading: 30, bottom: 0, trailing: 30))
        .navigationTitle(existingJournal == nil ? "Finalizar Registro" : "Editar Registro")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button(existingJournal == nil ? "Salvar" : "Atualizar") {
                    createNote()
                }
                .disabled(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
        }
    }
}

#Preview {
    JournalConclusionView(journalType: JournalTypeModel(type: "Rotina", color: "amarelo", symbol: "arrow.trianglehead.clockwise", questions: [
        "O que fiz hoje na minha rotina?",
        "Houve algo que me deixou confortável ou feliz?",
        "Houve algo que me incomodou?",
        "Como eu me senti e o que pensei sobre esse incômodo?",
        "O que funcionou bem na minha rotina?",
        "O que eu gostaria de ajustar para lidar com os incômodos da próxima vez?"]), answers: [
            "",
            "",
            "",
            "",
            "",
            ""
        ])
}
