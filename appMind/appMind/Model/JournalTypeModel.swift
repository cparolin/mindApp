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
    var title: String
    var questions: [String]
    
    init(title: String, questions: [String]) {
        self.title = title
        self.questions = questions
    }
    
    
}
