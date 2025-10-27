//
//  FavoriteHorizontalScroll.swift
//  appMind
//
//  Created by Dayô Araújo on 23/10/25.
//

import SwiftUI

/// Favorite journals horizontal scroll view.
/// Exibits 5 journals (prefix(5))
struct FavoriteHorizontalScroll: View {
    @State var favoriteJournals: [JournalModel]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(favoriteJournals.prefix(5)) { journal in
                    FavoriteJournalItem(journal: journal, baseColor: ColorName.from(name: journal.journalType.color))
                }
            }
            .padding(.horizontal, 20)
        }
    }
}
