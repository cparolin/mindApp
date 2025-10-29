//
//  TaskDayView.swift
//  appMind
//
//  Created by André Contarelli Lima on 23/10/25.
//

import SwiftData
import SwiftUI

struct TasksView: View {
    var tasksDay: [TaskDay]
    var tasks: [Task]
    
    var currentDate: Date
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 15) {
                ForEach(tasksDay) { task in
                    if isSameDate(task.todoDateDay, currentDate) {
                        TaskDayCardReduced(task: task, baseColor: ColorName.from(name: task.tintDay))
                    }
                    else {
                        Text("Sem tarefas para hoje")
                    }
                }
                
                Text("Rotina do dia")
                    .fontWeight(.semibold)
                    .font(.title3)
                    .padding(.bottom, 5)
                    .padding(.leading)
                
                //Cards
                ForEach(tasks) { task in
                    if isSameDate(task.todoDateStart, currentDate) {
                        TaskCardMedium(task: task, baseColor: ColorName.from(name: task.tint))
                    }
                    else {
                        Text("Sem tarefas para hoje")
                    }
                }
            }
            .padding(.top, 25)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    TasksView(tasksDay: [
        TaskDay(taskTitleDay: "aaaaa", todoDateDay: Date.now, tintDay: "azul", notesDay: "aaaa"),
        TaskDay(taskTitleDay: "aaaa", todoDateDay: Date.now, tintDay: "azul", notesDay: "aaaa"),
        TaskDay(taskTitleDay: "aaaa", todoDateDay: Date.now, tintDay: "azul", notesDay: "aaa"),
        TaskDay(taskTitleDay: "aaa", todoDateDay: Date.now, tintDay: "azul", notesDay: "aaa"),
        TaskDay(taskTitleDay: "aaa", todoDateDay: Date.now, tintDay: "azul", notesDay: "aaa")
    ], tasks: [
        Task(taskTitle: "Título", todoDateStart: Date.now, todoDateEnd: Date.now, isCompleted: false, tint: "azul", notes: ""),
        Task(taskTitle: "Título", todoDateStart: Date.now, todoDateEnd: Date.now, isCompleted: false, tint: "azul", notes: ""),
        Task(taskTitle: "Título", todoDateStart: Date.now, todoDateEnd: Date.now, isCompleted: false, tint: "azul", notes: "")
    ], currentDate: Date.now)
}
