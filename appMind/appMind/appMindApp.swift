//
//  appMindApp.swift
//  appMind
//
//  Created by Camila Parolin on 14/10/25.
//

import SwiftUI
import SwiftData

@main
struct appMindApp: App {
    @AppStorage("font") private var font = ""
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.font, Font.custom(font, size: 17))
                
        }
        .modelContainer(for: JournalModel.self)
    }
}
