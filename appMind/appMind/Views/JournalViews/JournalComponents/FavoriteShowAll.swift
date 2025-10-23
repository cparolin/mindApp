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
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.leading, 20)
            
            Spacer()
            
            NavigationLink {
                FavoriteJournalListView(favoriteNotes: favoriteJournals)
                
            } label: {
                Text("Mostrar tudo")
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .fontWeight(.semibold)
            }
            .padding(.trailing, 20)
        }
    }
}
