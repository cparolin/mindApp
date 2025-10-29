//
//  JournalGrid.swift
//  appMind
//
//  Created by Dayô Araújo on 22/10/25.
//

import SwiftUI
import SwiftData

struct JournalCoverScroll: View {
    var journals: [JournalTypeModel]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack (spacing: 25){
                ForEach(journals) { journal in
                    NavigationLink {
                        JournalListView(journalType: journal)
                    } label: {
                        JournalCover(
                            journal: journal,
                            baseColor: ColorName.from(name: journal.color),
                            secondaryColor: ColorName.from(name: journal.secondaryColor))
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }
}
