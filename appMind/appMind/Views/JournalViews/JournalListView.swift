//
//  RoutineJournalView.swift
//  appMind
//
//  Created by Dayô Araújo on 14/10/25.
//
import SwiftData
import SwiftUI

/// Exibits all the journals of the selected journal type
struct JournalListView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \JournalModel.journalType.type) var notes: [JournalModel]
    
    // State properties
    @State private var filteredNotes: [JournalModel] = []
    @State var journalType: JournalTypeModel
    @State private var searchText = ""
    
    /// Search based on the `searchText` that returns a [JournalModel] to the `searchResults` variable
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
                VStack (spacing: 12){
                    if filteredNotes.count == 0 {
                        Text("Nenhum registro adicionado")
                            .frame(width: 370)
                            .padding(.top, UIScreen.main.bounds.height * 0.33)
                        
                    } else if !searchText.isEmpty {
                        ForEach(searchResults) { note in
                            JournalItem(journal: note)
                        }
                    } else {
                        ForEach(filteredNotes) { note in
                            JournalItem(journal: note)
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
                    ///  The `filteredNotes` list receives the `notes` array
                    ///  filtered by journal type. The `journalType` used to
                    ///  make the comparison is received when the view is accessed
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
    JournalListView(journalType: JournalTypeModel(type: "Rotina", color: "amarelo", secondaryColor: "laranja", symbol: "arrow.trianglehead.clockwise", questions: [""]))
}
