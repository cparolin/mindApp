//
//  TaskDayView.swift
//  appMind
//
//  Created by André Contarelli Lima on 23/10/25.
//

import SwiftData
import SwiftUI

struct TasksView: View {
    @AppStorage("font") private var font = "SF Pro"
    @AppStorage("paletteLayout") private var paletteLayout: String = "Saturadas"
    @AppStorage("textLayout") private var textLayout: Int = 0
    
    var tasksDay: [TaskDay]
    var tasks: [Task]
    
    var currentDate: Date
    
    var body: some View {
        if tasks.isEmpty && tasksDay.isEmpty {
                Text("Sem Tarefas ainda...")
                .font(.changeFont(fontType: font, fontStyle: .title3, fontWeight: .regular))
                    .padding()

        }
        ScrollView(.vertical) {
            
            VStack(alignment: .leading, spacing: 15) {
                ForEach(tasksDay) { task in
                    if isSameDate(task.todoDateDay, currentDate) {
                        TaskDayCardReduced(task: task, baseColor: getPaletteColor(palette: paletteLayout, color: task.tintDay))
                    }
                }
                if !tasks.isEmpty && !tasksDay.isEmpty {
                    Text("Rotina do dia")
                        .font(.changeFont(fontType: font, fontStyle: .title3, fontWeight: isOpenDyslexic(font: font) ? .bold : .semibold))
                        .padding(.bottom, 5)
                        .padding(.leading)
                }
                //Cards
                ForEach(tasks) { task in
                    NavigationLink(){
                        EditingTaskView(taskBeengEdit: task)
                    } label: {
                        if isSameDate(task.todoDateStart, currentDate) {
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
