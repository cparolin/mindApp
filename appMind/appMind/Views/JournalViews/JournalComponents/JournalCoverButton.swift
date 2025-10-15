//
//  JournalCoverButton.swift
//  appMind
//
//  Created by Dayô Araújo on 15/10/25.
//

import SwiftUI

struct JournalCoverButton: View {
    public var filterType: Category
    
    var body: some View {
        NavigationLink {
            JournalListView(filterType: filterType)
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .frame(width: 172, height: 277)
                    .foregroundStyle(.gray)
                Text(filterType.rawValue)
                    .foregroundStyle(.black)
                    .font(.title)
            }
        }
    }
}

#Preview {
    JournalCoverButton(filterType: .routine)
}
