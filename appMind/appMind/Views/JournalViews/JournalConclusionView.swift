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
    
    var journalType: JournalTypeModel
    var answers: [String]
    
    @State private var title: String = ""
    @State private var desc: String = ""
    @State private var date: Date = Date.now
    
    func createNote() {
        let newNote = JournalModel(title: title, desc: desc, date: date, answers: answers, journalType: journalType)
        
        context.insert(newNote)
        dismiss()
    }
    
    var body: some View {
        VStack (spacing: 8){
            TextField("Título do Registro", text: $title)
                .font(.title2)
                .bold()
                .padding(.bottom, 10)
            
            TextField("Descrição Breve", text: $desc)
                .fontWeight(.semibold)
            
            Divider()
                .padding(.top, 4)
            
            DatePicker("Data do Registro", selection: $date, displayedComponents: .date)
                .padding(.top, 15)
            
            Spacer()
        }
        .padding(EdgeInsets(top: 30, leading: 30, bottom: 0, trailing: 30))
        .navigationTitle("Finalizar Registro")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Salvar") {
                    createNote()
                }
                
                .disabled(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
        }
    }
}

#Preview {
    JournalConclusionView(journalType: JournalTypeModel(type: "Rotina", questions: [
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
