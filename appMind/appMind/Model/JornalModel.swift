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
