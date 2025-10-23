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
    
    @AppStorage("font") private var font = "OpenDyslexic"
    
    init() {
        
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.font, Font.custom(font, size: 17))
        }
        .modelContainer(for: [JournalTypeModel.self, Task.self, JournalModel.self])
        
    }
//        .onChange(of: font) { oldValue, newValue in
//            init()
//        }
}
