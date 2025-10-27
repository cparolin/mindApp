//
//  JornalModel.swift
//  appMind
//
//  Created by Camila Parolin on 14/10/25.
//

import Foundation
import SwiftData
import SwiftUI
import Combine

@Model
class JournalModel {
    var id: UUID = UUID()
    var title: String
    var desc: String
    var date: Date
    var answers: [String]
    var journalType: JournalTypeModel
    var isFavorite: Bool
    
    init(title: String, desc: String, date: Date, answers: [String], journalType: JournalTypeModel, isFavorite: Bool = false) {
        self.title = title
        self.desc = desc
        self.date = date
        self.answers = answers
        self.journalType = journalType
        self.isFavorite = isFavorite
    }
}
