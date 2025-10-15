//
//  JornalModel.swift
//  appMind
//
//  Created by Camila Parolin on 14/10/25.
//

import Foundation
import SwiftData

@Model
class JournalModel {
    var id: UUID = UUID()
    var type: String
    var title: String
    var desc: String
    var date: Date
    var answers: [String]
    
    init(id: UUID, type: String, title: String, desc: String, date: Date, answers: [String]) {
        self.id = id
        self.type = type
        self.title = title
        self.desc = desc
        self.date = date
        self.answers = answers
    }
}

enum Category: String {
    case routine = "Rotina"
    case addiction = "Vício"
    case socialization = "Socialização"
}

enum RoutineQuestions: String, CaseIterable {
    case one = "O que fiz hoje na minha rotina?"
    case two = "Houve algo que me deixou confortável ou feliz?"
    case three = "Houve algo que me incomodou?"
    case four = "Como eu me senti e o que pensei sobre esse incômodo?"
    case five = "O que funcionou bem na minha rotina?"
    case six = "O que eu gostaria de ajustar para lidar com os incômodos da próxima vez?"
}

enum AddictionQuestions: String, CaseIterable {
    case one = "Qual situação antecedeu a vontade de praticar o hábito disfuncional?"
    case two = "Quais pensamentos disfuncionais surgiram por conta da situação?"
    case three = "Quais emoções surgiram a partir da situação e dos pensamentos disfuncionais?"
    case four = "Qual foi minha reação ou comportamento?"
    case five = "Como eu gostaria de ter reagido?"
    case six = "O que eu posso fazer para me ajudar quando algo parecido acontecer de novo?"
}

enum SocializationQuestions: String, CaseIterable {
    case one = "Onde eu estava e com quem?"
    case two = "O que aconteceu na prática? (Descrição da Situação)"
    case three = "Como eu participei dessa interação e como me senti? (Exemplos: falei bastante, mais escutei do que falei, me senti ansioso)"
    case four = "Resultado real da interação (Exemplos: fiquei satisfeito, houve entendimento mútuo)"
    case five = "O que aprendi ou percebi nessa interação? (Exemplos: funcionou melhor quando fiz perguntas)"
    case six = "O que quero manter ou melhorar para a próxima vez?"
}
