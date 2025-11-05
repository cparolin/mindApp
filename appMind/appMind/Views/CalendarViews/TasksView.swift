//
//  TaskDayView.swift
//  appMind
//
//  Created by André Contarelli Lima on 23/10/25.
//

import SwiftData
import SwiftUI

struct TasksView: View {
    @AppStorage("paletteLayout") private var paletteLayout: String = "Saturadas"
    @AppStorage("textLayout") private var textLayout: Int = 0
    
    var tasksDay: [TaskDay]
    var tasks: [Task]
    
    var currentDate: Date
    
    var body: some View {
        if tasks.isEmpty && tasksDay.isEmpty {
                Text("Sem Tarefas ainda...")
                .accessibilityLabel(Text("Sem tarefas ainda..."))
                .font(.title3)
                    .padding()

        }
        ScrollView(.vertical) {
            
            VStack(alignment: .leading) {
                ForEach(tasksDay) { task in
                    NavigationLink {
                        EditingTasksDayView(taskBeengEdit: task)
                    } label: {
                        if isSameDate(task.todoDateDay, currentDate) {
                            TaskDayCardReduced(task: task, baseColor: getPaletteColor(palette: paletteLayout, color: task.tintDay))
                        }
                    }
                    .accessibilityLabel(Text("Tarefa: \(task.taskTitleDay), do dia: \(task.todoDateDay)"))
                }
                if !tasks.isEmpty && !tasksDay.isEmpty {
                    Text("Rotina do dia")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.bottom, 5)
                        .padding(.leading)
                        .accessibilityLabel(Text("Rotina do dia:"))
                }
                //Cards
                ForEach(tasks) { task in
                    if isSameDate(task.todoDateStart, currentDate) {
                        NavigationLink(){
                            EditingTaskView(taskBeengEdit: task)
                        } label: {
                            if textLayout == 0 {
                                TaskCardExpanded(task: task, baseColor: getPaletteColor(palette: paletteLayout, color: task.tint))
                            }
                            if textLayout == 1 {
                                TaskCardMedium(task: task, baseColor: getPaletteColor(palette: paletteLayout, color: task.tint))
                            }
                            if textLayout == 2 {
                                TaskCardReduced(task: task, baseColor: getPaletteColor(palette: paletteLayout, color: task.tint))
                            }
                        }
                        .accessibilityLabel(Text("Tarefa: \(task.taskTitle), do dia: \(task.todoDateStart), que termina em: \(task.todoDateEnd). Descrição da tarefa: \(task.notes)"))
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
        TaskDay(taskTitleDay: "aaaaa", todoDateDay: Date.now, tintDay: "azul", notesDay: "aaaa", symbolDay: "bus.fill"),
        TaskDay(taskTitleDay: "aaaaa", todoDateDay: Date.now, tintDay: "azul", notesDay: "aaaa", symbolDay: "bus.fill"),
        TaskDay(taskTitleDay: "aaaaa", todoDateDay: Date.now, tintDay: "azul", notesDay: "aaaa", symbolDay: "bus.fill")
    ], tasks: [
        Task(taskTitle: "Título", todoDateStart: Date.now, todoDateEnd: Date.now, isCompleted: false, tint: "azul", notes: "", symbol: "bus.fill"),
        Task(taskTitle: "Título", todoDateStart: Date.now, todoDateEnd: Date.now, isCompleted: false, tint: "azul", notes: "", symbol: "bus.fill"),
        Task(taskTitle: "Título", todoDateStart: Date.now, todoDateEnd: Date.now, isCompleted: false, tint: "azul", notes: "", symbol: "bus.fill")
    ], currentDate: Date.now)
}
