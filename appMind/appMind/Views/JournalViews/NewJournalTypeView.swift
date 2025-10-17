//
//  NewJournalTypeView.swift
//  appMind
//
//  Created by Dayô Araújo on 16/10/25.
//
import SwiftData
import SwiftUI

struct NewJournalTypeView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    
    func createAndSave() {
        let questions = [question1, question2, question3, question4, question5, question6]
        
        let newJournal = JournalTypeModel(title: title, questions: questions)
        
        context.insert(newJournal)
    }
    
    @State private var title = ""
    @State private var question1 = ""
    @State private var question2 = ""
    @State private var question3 = ""
    @State private var question4 = ""
    @State private var question5 = ""
    @State private var question6 = ""
    
    private var questions: [String] = []

    var body: some View {
        NavigationStack {
            Form {
                TextField("Título do Diário", text: $title)
                TextField("Pergunta 1", text: $question1)
                TextField("Pergunta 2", text: $question2)
                TextField("Pergunta 3", text: $question3)
                TextField("Pergunta 4", text: $question4)
                TextField("Pergunta 5", text: $question5)
                TextField("Pergunta 6", text: $question6)
                
                .navigationTitle("Novo Diário")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading){
                        Button("Cancelar"){
                            dismiss()
                        }
                    }
                    
                    ToolbarItem(placement: .confirmationAction){
                        Button("Criar"){
                            createAndSave()
                            dismiss()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    NewJournalTypeView()
}
