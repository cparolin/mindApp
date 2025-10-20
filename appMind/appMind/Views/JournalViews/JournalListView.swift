//
//  RoutineJournalView.swift
//  appMind
//
//  Created by Dayô Araújo on 14/10/25.
//
import SwiftData
import SwiftUI

struct JournalListView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \JournalModel.journalType.type) var notes: [JournalModel]
    
    @State private var filteredNotes: [JournalModel] = []
    @State private var createNote = false
    @State var journalType: JournalTypeModel
    
    var body: some View {
        NavigationStack {
            VStack {
                if filteredNotes.count == 0 {
                    Text("Nenhum registro adicionado")
                } else {
                    ForEach(filteredNotes) { note in
                        Text(note.title)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        createNote = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Text(journalType
                        .type)
                }
            }
            .onAppear {
                filteredNotes = notes.filter({
                    $0.journalType.type.localizedStandardContains(journalType.type)
                })
            }
        }
    }
}

#Preview {
    JournalListView(journalType: JournalTypeModel(type: "Rotina", questions: [
        "O que fiz hoje na minha rotina?",
        "Houve algo que me deixou confortável ou feliz?",
        "Houve algo que me incomodou?",
        "Como eu me senti e o que pensei sobre esse incômodo?",
        "O que funcionou bem na minha rotina?",
        "O que eu gostaria de ajustar para lidar com os incômodos da próxima vez?"]))
}
