//
//  JournalTypeView.swift
//  appMind
//
//  Created by Dayô Araújo on 14/10/25.
//

import SwiftUI

struct JournalTypeView: View {
    @State var type: String
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                NavigationLink {
                    RoutineJournalView()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: 172, height: 277)
                        Text("Rotina")
                            .foregroundStyle(.black)
                    }
                }
                .padding(.top)
                .navigationTitle("Meus Diários")
                
                Spacer()
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

#Preview {
    JournalTypeView(type: "Rotina")
}
