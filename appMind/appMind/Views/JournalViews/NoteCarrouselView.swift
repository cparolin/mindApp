//
//  NoteCarrouselView.swift
//  appMind
//
//  Created by Dayô Araújo on 20/10/25.
//
import SwiftUI
import SwiftData

struct NoteCarrouselView: View {
    @Environment(\.modelContext) var context
    
    var journal: JournalTypeModel
    var existingJournal: JournalModel?
    
    // State variables
    @State private var currentIndex: Int = 0
    @State private var answers: [String] = []
    @State private var showFinalView: Bool = false
    
    /// Iterates the `currentIndex` variable until it reaches the array
    /// length, when the condition is met the boolean `showFinalView`
    /// is toggled
    func nextView() {
        if currentIndex < journal.questions.count - 1 {
            currentIndex += 1
        } else {
            showFinalView = true
        }
    }
    
    var body: some View {
        NavigationStack {
            Group {
                if showFinalView {
                    JournalConclusionView(existingJournal: existingJournal, journalType: journal, answers: answers)
                    
                } else if !answers.isEmpty {
                    NoteView(
                        answer: $answers[currentIndex],
                        question: journal.questions[currentIndex],
                        currentIndex: currentIndex,
                        totalQuestions: journal.questions.count,
                        onNext: nextView
                    )
                    .id(currentIndex)
                } else {
                    ProgressView()
                }
            }
            .navigationTitle(journal.type)
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            if let existing = existingJournal {
                answers = existing.answers
            }
            else if answers.isEmpty {
                answers = Array(repeating: "", count: journal.questions.count)
            }
        }
    }
}

#Preview {
    NoteCarrouselView(journal: JournalTypeModel(type: "Rotina", color: "amarelo", symbol: "arrow.trianglehead.clockwise", questions: [
        "O que fiz hoje na minha rotina?",
        "Houve algo que me deixou confortável ou feliz?",
        "Houve algo que me incomodou?",
        "Como eu me senti e o que pensei sobre esse incômodo?",
        "O que funcionou bem na minha rotina?",
        "O que eu gostaria de ajustar para lidar com os incômodos da próxima vez?"]))
}
