//
//  JournalItem.swift
//  appMind
//
//  Created by Dayô Araújo on 20/10/25.
//

import SwiftUI

struct JournalItem: View {
    var journal: JournalModel
    var journalType: JournalTypeModel
    
    let month = Date.FormatStyle()
        .month(.abbreviated)
    
    let day = Date.FormatStyle()
        .day(.twoDigits)
    
    var body: some View {
        NavigationLink {
            NoteCarrouselView(journal: journalType, existingJournal: journal)
            
        } label: {
            HStack (spacing: 20){
                VStack (spacing: 15){
                    Text(journal.date.formatted(month))
                        .font(.title2)
                    
                    Text(journal.date.formatted(day))
                        .font(.title)
                }
                .fontWeight(.semibold)
                
                VStack (alignment: .leading, spacing: 10){
                    Text(journal.title)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(journal.desc)
                        .font(.body)
                        .multilineTextAlignment(.leading)
                }
                .frame(width: UIScreen.main.bounds.width * 0.7)
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(.gray)
            )
            .foregroundStyle(.black)
        }
    }
}
