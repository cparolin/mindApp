//
//  FavoriteJournalItem.swift
//  appMind
//
//  Created by Dayô Araújo on 22/10/25.
//

import SwiftUI
import SwiftData

struct FavoriteJournalItem: View {
    var journal: JournalModel
    
    // month and day date formating
    let month = Date.FormatStyle().month(.abbreviated)
    let day = Date.FormatStyle().day(.twoDigits)
    
    var body: some View {
        NavigationLink {
            NoteCarrouselView(journal: journal.journalType, existingJournal: journal)
        } label: {
            ZStack {
                // Background
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: UIScreen.main.bounds.width * 0.55, height: UIScreen.main.bounds.height * 0.13)
                    .foregroundStyle(ColorName.from(name: journal.journalType.color))
                
                // Top right label
                VStack (alignment: .trailing, spacing: 1){
                    Text(journal.journalType.type)
                        .font(.caption)
                        .bold()
                        .padding(.trailing, 10)
                    Capsule()
                        .frame(width: 90, height: 1.5)
                }
                .offset(x: UIScreen.main.bounds.width * 0.15, y: UIScreen.main.bounds.height * -0.04)
                
                // Date, title and description
                VStack (alignment: .leading, spacing: 8){
                    // Month and day
                    HStack (spacing: 4){
                        Text(journal.date.formatted(day))
                            .bold()
                            .font(.body)
                            .italic()
                        
                        Text(journal.date.formatted(month))
                            .font(.callout)
                            .italic()
                        
                        Spacer()
                    }
                    // Title and description
                    VStack (alignment: .leading){
                        Text(journal.title)
                            .font(.subheadline)
                            .bold()
                        
                        Text(journal.desc)
                            .font(.caption)
                            .frame(width: UIScreen.main.bounds.width * 0.5, alignment: .topLeading)
                            .multilineTextAlignment(.leading)
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.15)
            }
        }
        .foregroundStyle(.black)
    }
}
