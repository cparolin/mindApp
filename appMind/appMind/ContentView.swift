//
//  ContentView.swift
//  appMind
//
//  Created by Camila Parolin on 14/10/25.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("font") private var font = "OpenDyslexic"
        
    init() {
        currentFont(to: font)
    }
    
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Label("Calendário", systemImage: "calendar.day.timeline.left")
                }
            JournalTypeView()
                .tabItem {
                    Label("Diários", systemImage: "book.pages")
                }
            AppearenceView()
                .tabItem {
                    Label("Configurações", systemImage: "gear")
                }
        }
    }
}

#Preview {
    ContentView()
}
