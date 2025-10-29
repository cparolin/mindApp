//
//  FavoriteShowAll.swift
//  appMind
//
//  Created by Dayô Araújo on 23/10/25.
//

import SwiftUI

struct FavoriteShowAll: View {
    @State var favoriteJournals: [JournalModel]
    
    var body: some View {
        HStack {
            Text("Favoritos")
                .font(.title3)
                .fontWeight(.semibold)
            
            Spacer()
            
            NavigationLink {
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
