//
//  NewNoteView.swift
//  appMind
//
//  Created by Dayô Araújo on 15/10/25.
//
import SwiftData
import SwiftUI

struct NewNoteView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    @State private var items: [String] = []
    
    @State var title = ""
    @State var desc = ""
    @State var answer1 = ""
    @State var answer2 = ""
    @State var answer3 = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("titulo", text: $title)
                TextField("descrição", text: $desc)
                TextField("pergunta 1", text: $answer1)
                TextField("pergunta 1", text: $answer2)
                TextField("pergunta 1", text: $answer3)
                Button("Criar"){
                    let note = JournalModel(id: UUID(), type: "Rotina", title: title, desc: desc, date: Date.now, answers: items)
                    context.insert(note)
                    dismiss()
                }
                .frame(maxWidth: .infinity)
                .buttonStyle(.borderedProminent)
                .navigationTitle("Novo registro")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading){
                        Button("Cancelar"){
                            dismiss()
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    NewNoteView()
}
