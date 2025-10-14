//
//  JornalModel.swift
//  appMind
//
//  Created by Camila Parolin on 14/10/25.
//

import Foundation

enum JournalType: String, CaseIterable {
    case socializacao = "Socialização"
    case vicio = "Vício"
    case rotina = "Rotina"
}

struct JournalModel {
    var id: UUID = UUID()
    var type: JournalType
    var title: String
    var description: String
    var date: Date
    var answers: [String]
}
