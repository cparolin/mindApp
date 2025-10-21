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
    var todoDate: Date
    var isCompleted: Bool
    var tint: String
    var notes: String
    
    init(taskTitle: String, todoDate: Date, isCompleted: Bool, tint: String, notes: String) {
        self.taskTitle = taskTitle
        self.todoDate = todoDate
        self.isCompleted = isCompleted
        self.tint = tint
        self.notes = notes
    }
}

extension Date {
    static func updateHour(_ value: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .hour, value: value, to: .init()) ?? .init()
    }
}
