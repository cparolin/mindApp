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
    @Query(sort: \JournalModel.type) var notes: [JournalModel]
    @State private var filteredNotes: [JournalModel] = []
    @State private var createNote = false
    public var filterType: Category
    
    var body: some View {
        NavigationStack {
            VStack {
                if notes.count == 0 {
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
                    Text(filterType.rawValue)
                }
            }
            .onAppear {
                filteredNotes = notes.filter({
                    $0.type.localizedStandardContains(filterType.rawValue)
                })
            }
        }
    }
}

#Preview {
    JournalListView(filterType: .routine)
}
