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
    @State private var AddJournalSheet = false
    var favorites: [JournalModel] = []
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(journals) { journal in
                        NavigationLink {
                            JournalListView(journalType: journal)
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .frame(width: UIScreen.main.bounds.width * 0.43, height: 217)
                                    .foregroundStyle(.gray)
                                Text(journal.type)
                                    .foregroundStyle(.black)
                                    .font(.title2)
                            }
                        }
                    }
                }
                .padding()
                .navigationTitle("Meus Diários")
                Spacer()
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
