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
    
    private var isAnswered: Bool {
        !answer.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            QuestionProgressIndicator(currentIndex: currentIndex, totalSteps: totalQuestions)
            
            Text(question)
                .font(.title3)
                .fontWeight(.semibold)
            
            TextEditor(text: $answer)
                .frame(minHeight: 150, maxHeight: .infinity)
                .overlay(
                    Group {
                        if answer.isEmpty {
                            Text("Aqui você escreve sobre o seu registro...")
                                .foregroundColor(Color(.placeholderText))
                                .padding(.top, 8)
                                .padding(.leading, 5)
                                .allowsHitTesting(false)
                        }
                    },
                    alignment: .topLeading
                )
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
            
            Spacer()
            
            HStack {
                Spacer()
                
                Button(action: onNext) {
                    Image(systemName: "arrow.right")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .background(isAnswered ? Color.blue : Color.gray)
                        .clipShape(Circle())
                }
                .disabled(!isAnswered)
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
    }
}

