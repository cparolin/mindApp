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
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: JournalTypeModel.self)
    }
}
