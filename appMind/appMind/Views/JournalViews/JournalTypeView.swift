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
            ScrollView {
                VStack (alignment: .leading, spacing: 25){
                    if !favoriteJournals.isEmpty {
                        VStack (alignment: .leading, spacing: 4){
                            
                            FavoriteShowAll(favoriteJournals: favoriteJournals)
                            
                            FavoriteHorizontalScroll(favoriteJournals: favoriteJournals)
                        }
                    }
                    
                    VStack (alignment: .leading){
                        Text("Todos os diários")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.leading, 20)
                        
                        JournalGrid(journals: journals)
                            .padding(.horizontal)
                    }
                    
                    Spacer()
                }
                .padding(.top, 30)
            }
            .navigationTitle("Meus Diários")
            .toolbar {
                ToolbarItem (placement: .confirmationAction){
                    Button {
                        AddJournalSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $AddJournalSheet) {
                NewJournalTypeView()
            }
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
