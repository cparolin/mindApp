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

    @State var title: String = ""
    @State var desc: String = ""
    @State var answer1: String = ""
    @State var answer2: String = ""
    @State var answer3: String = ""
    @State var answer4: String = ""
    @State var answer5: String = ""
    @State var answer6: String = ""
    
    func createNote() {
        let answers = [answer1, answer2, answer3, answer4, answer5, answer6]
        
        let newNote = JournalModel(title: title, desc: desc, date: Date.now, answers: answers, journalType: journal)
        
        context.insert(newNote)
    }
    
    var body: some View {
        NoteView(answer: $answer1, question: journal.questions[0])
    }
}

#Preview {
    NoteCarrouselView(journal: JournalTypeModel(type: "Rotina", questions: [
        "O que fiz hoje na minha rotina?",
        "Houve algo que me deixou confortável ou feliz?",
        "Houve algo que me incomodou?",
        "Como eu me senti e o que pensei sobre esse incômodo?",
        "O que funcionou bem na minha rotina?",
        "O que eu gostaria de ajustar para lidar com os incômodos da próxima vez?"]))
}
