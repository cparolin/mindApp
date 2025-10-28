//
//  JournalTypeView.swift
//  appMind
//
//  Created by Dayô Araújo on 14/10/25.
//
import SwiftData
import SwiftUI

/// Exibits the journal categories and 5 favorite notes
struct JournalTypeView: View {
    @Environment(\.modelContext) var context
    
    @Query private var journals: [JournalTypeModel]
    @Query private var allNotes: [JournalModel]
    
    @State private var AddJournalSheet = false
    
    /// Receives the `allNotes` array filtered by favorites
    var favoriteJournals: [JournalModel] {
        return allNotes.filter { $0.isFavorite == true }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView (showsIndicators: false) {
                VStack (alignment: .leading, spacing: 27){
                    if !favoriteJournals.isEmpty {
                        VStack (alignment: .leading, spacing: 4){
                            FavoriteShowAll(favoriteJournals: favoriteJournals)
                            
                            FavoriteHorizontalScroll(favoriteJournals: favoriteJournals)
                                .padding(.top, 10)
                        }
                        
                        VStack (alignment: .leading, spacing: 4){
                            FavoriteShowAll(favoriteJournals: favoriteJournals)
                            
                            FavoriteHorizontalScroll(favoriteJournals: favoriteJournals)
                                .padding(.top, 10)
                        }
                    }
                    
                    VStack (alignment: .leading, spacing: 15){
                        Text("Todos os diários")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(.leading, 20)
                        
                        JournalCoverScroll(journals: journals)
                    }
                    
                    Spacer()
                }
                .padding(.top, 10)
            }
            .navigationTitle("Meus Diários")
        }
        /// Pre set categories initialized when the app is launched for
        /// the first time
        .onAppear {
            appMind.initialJournalsCreation(journals: journals, context: context)
        }
    }
}

#Preview {
    JournalTypeView()
}
