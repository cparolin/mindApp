//
//  JournalItem.swift
//  appMind
//
//  Created by Dayô Araújo on 20/10/25.
//

import SwiftUI

struct JournalItem: View {
    @Environment(\.modelContext) private var context
    
    var journal: JournalModel
    var journalType: JournalTypeModel
    
    let month = Date.FormatStyle().month(.abbreviated)
    let day = Date.FormatStyle().day(.twoDigits)
    
    var body: some View {
        NavigationLink {
            NoteCarrouselView(journal: journalType, existingJournal: journal)
            
        } label: {
            ZStack {
                NoteBackground()
                
                HStack (spacing: -6){
                    HStack {
                        VStack (spacing: 9){
                            Text(journal.date.formatted(month))
                                .font(.title3)
                                .fontWeight(.semibold)
                            
                            Text(journal.date.formatted(day))
                                .font(.title)
                        }
                        
                        VStack (alignment: .leading, spacing: 9){
                            Text(journal.title)
                                .font(.title3)
                                .fontWeight(.semibold)
                            
                            Text(journal.desc)
                                .font(.callout)
                                .multilineTextAlignment(.leading)
                                .frame(width: UIScreen.main.bounds.width * 0.63, alignment: .topLeading)
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.69)
                    }.padding(.leading, 3)
                    
                    Button {
                        journal.isFavorite.toggle()
                    } label: {
                        if journal.isFavorite {
                            Image(systemName: "heart.fill")
                        }
                        else {
                            Image(systemName: "heart")
                        }
                    }
                    .offset(x: UIScreen.main.bounds.width * -0.015, y: UIScreen.main.bounds.height * -0.04)
                }
                .foregroundStyle(.black)
                .padding(.horizontal, 20)
                .padding(.vertical, 20)
            }
        }
    }
}
