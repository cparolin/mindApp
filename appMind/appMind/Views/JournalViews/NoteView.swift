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
    @Binding var currentIndex: Int
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
                if currentIndex >= 1 {
                    Button {
                        currentIndex = currentIndex - 1
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                    .padding(.bottom, 30)
                }
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

struct QuestionProgressIndicator: View {
    var currentIndex: Int
    var totalSteps: Int
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<totalSteps, id: \.self) { index in
                Capsule()
                    .fill(index <= currentIndex ? Color.blue : Color.gray)
                    .frame(height: 6)
            }
        }
    }
}
