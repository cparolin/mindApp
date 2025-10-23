//
//  JournalTypeView.swift
//  appMind
//
//  Created by Dayô Araújo on 14/10/25.
//
import SwiftData
import SwiftUI

struct JournalTypeView: View {
    @Environment(\.modelContext) var context
    
    @Query private var journals: [JournalTypeModel]
    @Query private var allNotes: [JournalModel]
    
    @State private var AddJournalSheet = false
    
    var favoriteJournals: [JournalModel] {
        return allNotes.filter { $0.isFavorite == true }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack (alignment: .leading){
                    if !favoriteJournals.isEmpty {
                        Text("Favoritos")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.top)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(favoriteJournals) { journal in
                                    FavoriteJournalItem(journal: journal)
                                }
                            }
                        }
                    }
                    
                    Text("Meus Diários")
                        .font(.title2)
                        .bold()
                    JournalGrid(journals: journals)
                    
                    Spacer()
                }.padding()
            }
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
        .onAppear {
            appMind.initialJournalsCreation(journals: journals, context: context)
        }
    }
}

#Preview {
    JournalTypeView()
}
