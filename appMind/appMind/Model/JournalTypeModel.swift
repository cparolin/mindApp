//
//  JournalTypeModel.swift
//  appMind
//
//  Created by Dayô Araújo on 16/10/25.
//
import TipKit
import Foundation
import SwiftData

@Model
class JournalTypeModel {
    var id: UUID = UUID()
    var type: String
    var questions: [String]
    
    init(type: String, questions: [String]) {
        self.type = type
        self.questions = questions
    }
}

func initialJournalsCreation(journals: [JournalTypeModel], context: ModelContext) {
    if journals.isEmpty {
        let routine: JournalTypeModel = JournalTypeModel(type: "Rotina", questions: [
            "O que fiz hoje na minha rotina?",
            "Houve algo que me deixou confortável ou feliz?",
            "Houve algo que me incomodou?",
            "Como eu me senti e o que pensei sobre esse incômodo?",
            "O que funcionou bem na minha rotina?",
            "O que eu gostaria de ajustar para lidar com os incômodos da próxima vez?"
        ])
        
        let addiction = JournalTypeModel(type: "Vícios", questions: [
            "Qual situação antecedeu a vontade de praticar o hábito disfuncional?",
            "Quais pensamentos disfuncionais surgiram por conta da situação?",
            "Quais emoções surgiram a partir da situação e dos pensamentos disfuncionais?",
            "Qual foi minha reação ou comportamento?",
            "Como eu gostaria de ter reagido?",
            "O que eu posso fazer para me ajudar quando algo parecido acontecer de novo?"
        ])
        
        let socialization = JournalTypeModel(type: "Socialização", questions: [
            "Onde eu estava e com quem?",
            "O que aconteceu na prática? (Descrição da Situação)",
            "Como eu participei dessa interação e como me senti? (Exemplos: falei bastante, mais escutei do que falei, me senti ansioso)",
            "Resultado real da interação (Exemplos: fiquei satisfeito, houve entendimento mútuo)",
            "O que aprendi ou percebi nessa interação? (Exemplos: funcionou melhor quando fiz perguntas)",
            "O que quero manter ou melhorar para a próxima vez?"
        ])
        
        context.insert(routine)
        context.insert(addiction)
        context.insert(socialization)
        
    } else {
        print("Erro")
    }
}
