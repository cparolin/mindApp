//
//  FavoriteJournalListView.swift
//  appMind
//
//  Created by Dayô Araújo on 23/10/25.
//

import SwiftUI

/// Exibits all the journals on the favorite list
struct ListView: View {
    @State var notes: [JournalModel]
    @State var searchText = ""
    var isFavorite: Bool
    
    var searchResults: [JournalModel] {
        if searchText.isEmpty {
            return []
        } else {
            let results = notes.filter { note in
                note.title.localizedStandardContains(searchText)
            }
            return results
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView (.vertical){
                VStack (spacing: 12){
                    if notes.count == 0 {
                        Text("Nenhum registro adicionado")
                            .frame(width: 370)
                            .padding(.top, UIScreen.main.bounds.height * 0.33)
                        
                    } else if !searchText.isEmpty {
                        ForEach(searchResults) { note in
                            JournalItem(journal: note)
                        }
                    } else {
                        ForEach(notes) { note in
                            JournalItem(journal: note)
                        }
                    }
                }
            }
            .searchable(text: $searchText)
            .navigationTitle(isFavorite ? "Diários Favoritos" : "Todos os Registros")
            .toolbarBackground(.hidden, for: .navigationBar)
        }
    }
}
