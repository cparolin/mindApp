//
//  NewJournalCover.swift
//  appMind
//
//  Created by Dayô Araújo on 22/10/25.
//
import SwiftUI

struct NewJournalCover: View {
    @Binding var title: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(.yellow)
                .frame(width: UIScreen.main.bounds.width * 0.52, height: 247)
            
            TextField("Nome", text: $title)
                .bold()
                .font(.title)
                .padding(EdgeInsets(top: 185, leading: 85, bottom: 0, trailing: 0))
                .limitInputLength(value: $title, length: 9)
        }
    }
}
