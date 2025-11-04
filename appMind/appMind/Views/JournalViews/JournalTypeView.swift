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
    @AppStorage("font") private var font = "SF Pro"
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
                        Text("Meus Diários")
                            .font(.changeFont(fontType: font, fontStyle: .title, fontWeight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 20)
                        
                        if !allNotes.isEmpty {
                            VStack (alignment: .leading, spacing: 4){
                                RecentShowAll(recentJournals: allNotes)
                                
                                NotesHorizontalScroll(notes: allNotes)
                                    .padding(.top, 10)
                            }
                        }
                        
                        if !favoriteJournals.isEmpty {
                            VStack (alignment: .leading, spacing: 4){
                                FavoriteShowAll(favoriteJournals: favoriteJournals)
                                
                                NotesHorizontalScroll(notes: favoriteJournals)
                                    .padding(.top, 10)
                            }
                        }
                        
                        VStack (alignment: .leading, spacing: 15){
                            Text("Todos os diários")
                                .font(.changeFont(fontType: font, fontStyle: .title3, fontWeight: isOpenDyslexic(font: font) ? .bold : .semibold))
                                .padding(.leading, 20)
                            
                            JournalCoverScroll(journals: journals)
                        }
                        
                        Spacer()
                    }
                    .padding(.top, 10)
                }
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

/// journals horizontal scroll view.
/// Exibits 5 journals (prefix(5))
struct NotesHorizontalScroll: View {
    @State var notes: [JournalModel]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 25) {
                ForEach(notes.prefix(5)) { note in
                    ReducedJournalItem(journal: note)
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    JournalTypeView()
}
