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
    
    @State private var createNote = false
    var navTitle: String
    
//    @Query(filter: #Predicate<JournalModel> { note in
//        note.type.localizedStandardContains("Rotina")})
    
    var body: some View {
        NavigationStack {
            VStack {
                if notes.count == 0 {
                    Text("Nenhum registro adicionado")
                } else {
                    List{
                        ForEach(notes) { note in
                            Text(note.title)
                        }
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
                    Text(navTitle)
                }
            }
            .listStyle(.plain)
            .sheet(isPresented: $createNote) {
                NewNoteView()
            }
        }
    }
}

#Preview {
    JournalListView(navTitle: "Rotina")
}
