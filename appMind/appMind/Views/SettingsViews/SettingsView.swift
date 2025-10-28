//
//  SettingsView.swift
//  appMind
//
//  Created by Camila Parolin on 27/10/25.
//

import SwiftUI

struct SettingsView: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    List {
                        NavigationLink(destination: NotificationsView()) {
                            Image(systemName: "bell.badge")
                            Text("Notificações")
                        }
                        NavigationLink(destination: AppearenceView()) {
                            HStack {
                                Image(systemName: "paintpalette")
                                Text("Aparência")
                            }
                        }
                                       
                        
                    }
                }
            }
            .navigationTitle("Ajustes")
        }
    }
}

#Preview {
    SettingsView()
}
