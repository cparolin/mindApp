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
            ZStack {
                Rectangle()
                .foregroundColor(.clear)
                .frame(width: UIScreen.main.bounds.width * 0.9, height: 113)
                .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                .cornerRadius(16)
                
                HStack {
                    VStack (spacing: 10){
                        Text(journal.date.formatted(month))
                            .font(.title2)
                        
                        Text(journal.date.formatted(day))
                            .font(.title)
                    }
                    .padding(.leading)
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
                .foregroundStyle(.black)
            }
        }
    }
}
