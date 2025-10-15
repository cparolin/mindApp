//
//  ContentView.swift
//  appMind
//
//  Created by Camila Parolin on 14/10/25.
//

import SwiftUI

struct ContentView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            LazyVGrid(columns: columns) {
                NavigationLink {
                    JournalListView(navTitle: "Rotina")
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: 172, height: 277)
                            .foregroundStyle(.gray)
                        Text("Rotina")
                            .foregroundStyle(.black)
                            .font(.title)
                    }
                }
                
                NavigationLink {
                    JournalListView(navTitle: "Vícios")
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: 172, height: 277)
                            .foregroundStyle(.gray)
                        Text("Vícios")
                            .foregroundStyle(.black)
                            .font(.title)
                    }
                }
                
                NavigationLink {
                    JournalListView(navTitle: "Socialização")
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: 172, height: 277)
                            .foregroundStyle(.gray)
                        Text("Socialização")
                            .foregroundStyle(.black)
                            .font(.title)
                    }
                }
            }
            .padding(.top)
            .navigationTitle("Meus Diários")
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
