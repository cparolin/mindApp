//
//  NoteView.swift
//  appMind
//
//  Created by Dayô Araújo on 20/10/25.
//

import SwiftUI

struct NoteView: View {
    @Binding var answer: String
    var question: String
    
    var body: some View {
        NavigationStack {
            VStack (alignment: .leading, spacing: 30){
                QuestionProgressIndicator()
                
                Text(question)
                    .font(.title3)
                    .fontWeight(.semibold)
                
                TextField("placeholder", text: $answer)
                
                Spacer()
            }
            .padding(.horizontal, 40)
            .navigationTitle("Registro de pensamentos")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
