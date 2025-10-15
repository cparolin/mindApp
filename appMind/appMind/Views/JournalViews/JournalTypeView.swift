//
//  JournalTypeView.swift
//  appMind
//
//  Created by Dayô Araújo on 14/10/25.
//

import SwiftUI

struct JournalTypeView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            LazyVGrid(columns: columns) {
                JournalCoverButton(filterType: .routine)
                JournalCoverButton(filterType: .addiction)
                JournalCoverButton(filterType: .socialization)
            }
            .padding(.top)
            .navigationTitle("Meus Diários")
            Spacer()
        }
    }
}

#Preview {
    JournalTypeView()
}
