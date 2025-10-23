//
//  JournalGrid.swift
//  appMind
//
//  Created by Dayô Araújo on 22/10/25.
//

import SwiftUI
import SwiftData

struct JournalGrid: View {
    var journals: [JournalTypeModel]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        LazyVGrid(columns: columns, spacing: 15) {
            ForEach(journals) { journal in
                NavigationLink {
                    JournalListView(journalType: journal)
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: UIScreen.main.bounds.width * 0.43, height: 217)
                            .foregroundStyle(ColorName.from(name: journal.color))
                        
                        VStack (spacing: 10){
                            Image(systemName: journal.symbol)
                                .font(.largeTitle)
                            
                            Text(journal.type)
                                .font(.title2)
                                .bold()
                        }
                        .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}
