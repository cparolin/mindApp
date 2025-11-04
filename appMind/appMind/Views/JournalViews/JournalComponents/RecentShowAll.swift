//
//  RecentShowAll.swift
//  appMind
//
//  Created by Dayô Araújo on 28/10/25.
//

import SwiftUI

struct RecentShowAll: View {
    @AppStorage("font") private var font = "SF Pro"
    var recentJournals: [JournalModel]
    
    var body: some View {
        HStack {
            Text("Recentes")
                .font(.changeFont(fontType: font, fontStyle: .title3, fontWeight: isOpenDyslexic(font: font) ? .bold : .semibold))
            
            Spacer()
            
            NavigationLink {
                // Passes the notes array and indicates that it's not the favorites list
                ListView(notes: recentJournals, isFavorite: false)
                
            } label: {
                Text("Mostrar tudo")
                    .font(.changeFont(fontType: font, fontStyle: .caption, fontWeight: isOpenDyslexic(font: font) ? .bold : .semibold))
                    .foregroundStyle(.gray)
            }
        }
        .padding(.horizontal, 20)
    }
}
