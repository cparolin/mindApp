//
//  RoutineJournalView.swift
//  appMind
//
//  Created by Dayô Araújo on 14/10/25.
//
import SwiftData
import SwiftUI

struct RoutineJournalView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \JournalModel.title) private var note: [JournalModel]
    
    var body: some View {
        NavigationStack {
            VStack {
                if note.count == 0 {
                    Text("Nenhum registro adicionado")
                } else {
                    
                }
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Image(systemName: "plus")
                }
                
                ToolbarItem(placement: .principal) {
                    Text("Rotina")
                }
            }
        }
    }
}

#Preview {
    RoutineJournalView()
}
