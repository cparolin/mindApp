//
//  FavoriteHorizontalScroll.swift
//  appMind
//
//  Created by Dayô Araújo on 23/10/25.
//

import SwiftUI

/// journals horizontal scroll view.
/// Exibits 5 journals (prefix(5))
struct NotesHorizontalScroll: View {
    @State var notes: [JournalModel]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 25) {
                ForEach(notes.prefix(5)) { note in
                    ReducedJournalItem(journal: note, baseColor: ColorName.from(name: note.journalType.color))
                }
            }
            .padding(.horizontal, 20)
        }
    }
}
