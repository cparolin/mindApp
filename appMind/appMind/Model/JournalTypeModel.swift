//
//  JournalTypeModel.swift
//  appMind
//
//  Created by Dayô Araújo on 16/10/25.
//

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
