//
//  FavoriteJournalListView.swift
//  appMind
//
//  Created by Dayô Araújo on 23/10/25.
//

import SwiftUI

struct FavoriteJournalListView: View {
    @State var favoriteNotes: [JournalModel]
    @State var searchText = ""
    
    var searchResults: [JournalModel] {
        if searchText.isEmpty {
            return []
        } else {
            let results = favoriteNotes.filter { note in
                note.title.localizedStandardContains(searchText)
            }
            
            return results
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView (.vertical){
                VStack (spacing: 12){
                    if favoriteNotes.count == 0 {
                        Text("Nenhum registro adicionado")
                            .frame(width: 370)
                            .padding(.top, UIScreen.main.bounds.height * 0.33)
                        
                    } else if !searchText.isEmpty {
                        ForEach(searchResults) { note in
                            JournalItem(journal: note)
                        }
                    } else {
                        ForEach(favoriteNotes) { note in
                            JournalItem(journal: note)
                        }
                    }
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Diários Favoritos")
        }
    }
}
