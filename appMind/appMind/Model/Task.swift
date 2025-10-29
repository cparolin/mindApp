//
//  Task.swift
//  TodoPOC
//
//  Created by André Contarelli Lima on 06/10/25.
//
import SwiftData
import SwiftUI
import Foundation

@Model
class Task {
    var taskTitle: String
    var todoDateStart: Date
    var todoDateEnd: Date
    var isCompleted: Bool
    var tint: String
    var notes: String
    var symbol: String
    
    init(taskTitle: String, todoDateStart: Date, todoDateEnd: Date, isCompleted: Bool, tint: String, notes: String, symbol: String) {
        self.taskTitle = taskTitle
        self.todoDateStart = todoDateStart
        self.todoDateEnd = todoDateEnd
        self.isCompleted = isCompleted
        self.tint = tint
        self.notes = notes
        self.symbol = symbol
    }
}

//extension Date {
//    static func updateHour(_ value: Int) -> Date {
//        let calendar = Calendar.current
//        return calendar.date(byAdding: .hour, value: value, to: .init()) ?? .init()
//    }
//}
