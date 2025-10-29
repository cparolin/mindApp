//
//  TaskDay.swift
//  appMind
//
//  Created by André Contarelli Lima on 23/10/25.
//

import SwiftData
import SwiftUI

@Model
class TaskDay {
    var taskTitleDay: String
    var todoDateDay: Date
    var tintDay: String
    var notesDay: String
    var symbolDay: String
    
    init(taskTitleDay: String, todoDateDay: Date, tintDay: String, notesDay: String, symbolDay: String) {
        self.taskTitleDay = taskTitleDay
        self.todoDateDay = todoDateDay
        self.tintDay = tintDay
        self.notesDay = notesDay
        self.symbolDay = symbolDay
    }
}
