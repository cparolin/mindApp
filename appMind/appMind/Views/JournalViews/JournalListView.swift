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
    @State var journalType: JournalTypeModel
    @State private var searchText = ""
    
    var searchResults: [JournalModel] {
        if searchText.isEmpty {
            return []
        } else {
            let results = filteredNotes.filter { note in
                note.title.localizedStandardContains(searchText)
            }
            
            return results
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView (.vertical){
                VStack {
                    if filteredNotes.count == 0 {
                        Text("Nenhum registro adicionado")
                            .frame(width: 370)
                            .padding(.top, UIScreen.main.bounds.height * 0.33)
                        
                    } else if !searchText.isEmpty {
                        ForEach(searchResults) { note in
                            JournalItem(journal: note, journalType: journalType)
                        }
                    } else {
                        ForEach(filteredNotes) { note in
                            JournalItem(journal: note, journalType: journalType)
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        NavigationLink {
                            NoteCarrouselView(journal: journalType)
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
                .onAppear {
                    filteredNotes = notes.filter({
                        $0.journalType.type.localizedStandardContains(journalType.type)
                    })
                }
            }
            .searchable(text: $searchText)
            .navigationTitle(journalType.type)
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
