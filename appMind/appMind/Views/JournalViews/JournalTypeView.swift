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
    @Query(sort: [SortDescriptor(\JournalModel.date, order: .reverse)]) var allNotes: [JournalModel]
    
    /// Receives the `allNotes` array filtered by favorites
    var favoriteJournals: [JournalModel] {
        return allNotes.filter { $0.isFavorite == true }
    }
    
    var body: some View {
        NavigationStack {
            NavigationView {
                ScrollView (showsIndicators: false) {
                    VStack (alignment: .leading, spacing: 27){
                        if !allNotes.isEmpty {
                            VStack (alignment: .leading, spacing: 4){
                                RecentShowAll(recentJournals: allNotes)
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 25) {
                                        ForEach(allNotes.prefix(5)) { note in
                                            ReducedJournalItem(journal: note)
                                        }
                                    }
                                    .padding(.horizontal, 20)
                                    .padding(.top, 10)
                                }
                            }
                        }
                        
                        if !favoriteJournals.isEmpty {
                            VStack (alignment: .leading, spacing: 4){
                                FavoriteShowAll(favoriteJournals: favoriteJournals)
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 25) {
                                        ForEach(favoriteJournals.prefix(5)) { note in
                                            ReducedJournalItem(journal: note)
                                        }
                                    }
                                    .padding(.horizontal, 20)
                                    .padding(.top, 10)
                                }
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
                .toolbarBackground(.hidden, for: .navigationBar)
            }
        }
        /// Pre set categories initialized when the app is launched for
        /// the first time
        .onAppear {
            JournalTypeModel.initialJournalsCreation(journals: journals, context: context)
        }
    }
}

#Preview {
    JournalTypeView()
}
