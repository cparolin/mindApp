//
//  ContentView.swift
//  appMind
//
//  Created by Camila Parolin on 14/10/25.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("font") private var font = "SFPro"
        
    init() {
        currentFont(to: font)
    }
    
    @State var appState = AppState()
    
    var body: some View {
        if !appState.firstTimeOnApp {
            OnboardingView()
                .environment(appState)
        }
        else {
            TabView {
                Home()
                    .tabItem {
                        Label("Calendário", systemImage: "calendar.day.timeline.left")
                    }
                JournalTypeView()
                    .tabItem {
                        Label("Diários", systemImage: "book.pages")
                    }
                SettingsView()
                    .tabItem {
                        Label("Configurações", systemImage: "gear")
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
