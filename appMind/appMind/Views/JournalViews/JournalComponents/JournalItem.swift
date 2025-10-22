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
//    @State var favorites: [JournalModel]
//    @State var isFavorite: Bool = false
    
    let month = Date.FormatStyle()
        .month(.abbreviated)
    
    let day = Date.FormatStyle()
        .day(.twoDigits)
    
    var body: some View {
        NavigationLink {
            NoteCarrouselView(journal: journalType, existingJournal: journal)
            
        } label: {
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
                
//                Button {
//                    isFavorite.toggle()
//                    favorites.append(journal)
//                } label: {
//                    if isFavorite { Image(systemName: "heart.fill") }
//                    else { Image(systemName: "heart") }
//                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(Color(red: 1, green: 0.97, blue: 0.89))
                    
                    Rectangle()
                        .clipShape(
                            .rect(
                                topLeadingRadius: 0,
                                bottomLeadingRadius: 0,
                                bottomTrailingRadius: 16,
                                topTrailingRadius: 16
                            )
                        )
                        .foregroundStyle(Color(red: 0.96, green: 0.72, blue: 0))
                        .frame(width: UIScreen.main.bounds.width * 0.12)
                        .padding(.leading, UIScreen.main.bounds.width * 0.79)
                }
            )
            .shadow(color: .black.opacity(0.09), radius: 4.1, x: 0, y: 1)
            .foregroundStyle(.black)
        }
    }
}
