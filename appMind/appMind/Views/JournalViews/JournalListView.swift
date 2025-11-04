//
//  JournalListView.swift
//  appMind
//
//  Created by Dayô Araújo on 14/10/25.
//
import SwiftData
import SwiftUI

/// Exibits all the journals of the selected journal type
struct JournalListView: View {
    @AppStorage("font") private var font = "SF Pro"
    @Environment(\.modelContext) private var context
    @Query(sort: \JournalModel.date, order: .reverse) var allNotes: [JournalModel]
    
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
                    Text(journalType.type)
                        .font(.changeFont(fontType: font, fontStyle: .title, fontWeight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 20)
                    
                    if filteredNotes.count == 0 {
                        Text("Nenhum registro adicionado")
                            .font(.changeFont(fontType: font, fontStyle: .body, fontWeight: .regular))
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
                    filteredNotes = allNotes.filter({
                        $0.journalType.type.localizedStandardContains(journalType.type)
                    })
                }
                .padding(.top)
            }
            .searchable(text: $searchText)
            .toolbarBackground(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    JournalListView(journalType: JournalTypeModel(type: "Rotina", symbol: "arrow.trianglehead.clockwise", questions: [""]))
}
