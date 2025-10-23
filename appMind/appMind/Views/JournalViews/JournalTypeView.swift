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
                VStack (alignment: .leading, spacing: 25){
                    if !favoriteJournals.isEmpty {
                        VStack (alignment: .leading, spacing: 4){
                            HStack {
                                Text("Favoritos")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .padding(.leading, 20)
                                
                                Spacer()
                                
                                NavigationLink {
                                    FavoriteJournalListView(favoriteNotes: favoriteJournals)
                                    
                                } label: {
                                    Text("Mostrar tudo")
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                        .fontWeight(.semibold)
                                }
                                .padding(.trailing, 20)
                            }
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 15) {
                                    ForEach(favoriteJournals.prefix(5)) { journal in
                                        FavoriteJournalItem(journal: journal)
                                    }
                                }
                                .padding(.horizontal, 20)
                            }
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
        .onAppear {
            appMind.initialJournalsCreation(journals: journals, context: context)
        }
    }
}

#Preview {
    JournalTypeView()
}
