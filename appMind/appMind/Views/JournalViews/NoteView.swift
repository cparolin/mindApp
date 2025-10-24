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
    var currentIndex: Int
    var totalQuestions: Int
    var onNext: () -> Void
    
    // Variable to make the text field autofocused
    @FocusState private var focused: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            QuestionProgressIndicator(currentIndex: currentIndex, totalSteps: totalQuestions)
            
            Text(question)
                .font(.title3)
                .fontWeight(.semibold)
            
            TextField("", text: $answer, axis: .vertical)
                .focused($focused)
            
            Spacer()
            
            HStack {
                Spacer()
                Button(action: onNext) {
                    Image(systemName: "arrow.right")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(Circle())
                }
                .padding(.bottom, 30)
            }
        }
        .padding(.horizontal, 40)
        .padding(.top, 20)
        .onAppear {
            focused = true
        }
    }
}
