//
//  FavoriteShowAll.swift
//  appMind
//
//  Created by Dayô Araújo on 23/10/25.
//

import SwiftUI

struct FavoriteShowAll: View {
    var favoriteJournals: [JournalModel]
    
    var body: some View {
        HStack {
            Text("Favoritos")
                .font(.title3)
                .fontWeight(.semibold)
            
            Spacer()
            
            NavigationLink {
                // Passes the notes array and indicates that it is the favorites list
                ListView(notes: favoriteJournals, isFavorite: true)
                
            } label: {
                Text("Mostrar tudo")
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .fontWeight(.semibold)
            }
        }
        .padding(.horizontal, 20)
    }
}
