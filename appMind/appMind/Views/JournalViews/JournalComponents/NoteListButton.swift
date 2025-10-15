//
//  NoteListButton.swift
//  appMind
//
//  Created by Dayô Araújo on 15/10/25.
//

import SwiftUI

struct NoteListButton: View {
    var body: some View {
        NavigationLink {
            
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .frame(width: 320, height: 130)
                HStack (spacing: 30){
                    VStack (spacing: 15){
                        Text("Nov")
                            .font(.title2)
                        Text("13")
                            .font(.title)
                    }
                    
                    VStack (alignment: .leading) {
                        Text("Título")
                            .font(.title2)
                        Text("Lorem Ipsum é simplesmente uma simulação")
                            .multilineTextAlignment(.leading)
                    }
                    Spacer()
                }
                .padding(.leading, 50)
            }
        }
    }
}

#Preview {
    NoteListButton()
}
