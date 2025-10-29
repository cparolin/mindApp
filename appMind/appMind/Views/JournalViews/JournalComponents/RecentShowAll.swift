//
//  RecentShowAll.swift
//  appMind
//
//  Created by Dayô Araújo on 28/10/25.
//

import SwiftUI

struct RecentShowAll: View {
    @State var recentJournals: [JournalModel]
    
    var body: some View {
        HStack {
            Text("Recentes")
                .font(.title3)
                .fontWeight(.semibold)
            
            Spacer()
            
            NavigationLink {
                ListView(notes: recentJournals, isFavorite: false)
                
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
