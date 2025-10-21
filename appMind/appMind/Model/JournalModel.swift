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
    var title: String
    var desc: String
    var date: Date
    var answers: [String]
    var journalType: JournalTypeModel
     
    init(title: String, desc: String, date: Date, answers: [String], journalType: JournalTypeModel) {
        self.title = title
        self.desc = desc
        self.date = date
        self.answers = answers
        self.journalType = journalType
    }
}
