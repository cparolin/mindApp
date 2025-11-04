//
//  FavoriteShowAll.swift
//  appMind
//
//  Created by Dayô Araújo on 23/10/25.
//

import SwiftUI

struct FavoriteShowAll: View {
    @AppStorage("font") private var font = "SF Pro"
    var favoriteJournals: [JournalModel]
    
    var body: some View {
        HStack {
            Text("Favoritos")
                .font(.changeFont(fontType: font, fontStyle: .title3, fontWeight: isOpenDyslexic(font: font) ? .bold : .semibold))
            
            Spacer()
            
            NavigationLink {
                // Passes the notes array and indicates that it is the favorites list
                ListView(notes: favoriteJournals, isFavorite: true)
                
            } label: {
                Text("Mostrar tudo")
                    .font(.changeFont(fontType: font, fontStyle: .caption, fontWeight: isOpenDyslexic(font: font) ? .bold : .semibold))
                    .foregroundStyle(.gray)
            }
        }
        .padding(.horizontal, 20)
    }
}
