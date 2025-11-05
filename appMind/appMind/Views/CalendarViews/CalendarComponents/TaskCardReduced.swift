//
//  TaskCardReduced.swift
//  appMind
//
//  Created by Dayô Araújo on 28/10/25.
//

import SwiftUI

struct TaskCardReduced: View {
    var task: Task
    var baseColor: String

    var body: some View {
        HStack {
            Image(systemName: task.symbol)
                .foregroundStyle(.black)
                .frame(width: 60, height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(Color(baseColor))
                )
                .accessibilityLabel(Text("Símbolo da Tarefa: \(task.symbol)"))
            
            HStack (spacing: 0){
                Text(task.taskTitle)
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .padding(.leading, 10)
                    .accessibilityLabel(Text("Título da tarefa: \(task.taskTitle)"))
                
                Spacer()
                
                completionButton(task: task, baseColor: baseColor)
                
            }
            .padding(.vertical, 15)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color(baseColor), lineWidth: 2)
                    .fill(Color(baseColor).opacity(0.15))
            )
        }
        .padding(.horizontal, 15)
        .strikethrough(task.isCompleted, pattern: .solid, color: .black)
    }
}

//#Preview {
//    TaskCardReduced(task: Task(taskTitle: "Título", todoDateStart: Date.now, todoDateEnd: Date.now, isCompleted: false, tint: "azul", notes: "descrição", symbol: "bus.fill"), baseColor: .yellow)
//}
