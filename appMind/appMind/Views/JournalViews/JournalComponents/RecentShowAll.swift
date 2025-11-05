//
//  RecentShowAll.swift
//  appMind
//
//  Created by Dayô Araújo on 28/10/25.
//

import SwiftUI

struct RecentShowAll: View {
    var recentJournals: [JournalModel]
    
    var body: some View {
        HStack {
            Text("Recentes")
                .font(.title3)
                .fontWeight(.semibold)
            
            Spacer()
            
            NavigationLink {
                // Passes the notes array and indicates that it's not the favorites list
                ListView(notes: recentJournals, isFavorite: false)
                
            } label: {
                Text("Mostrar tudo")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
            }
        }
        .padding(.horizontal, 20)
    }
}
