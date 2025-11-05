//
//  TaskCard.swift
//  appMind
//
//  Created by André Contarelli Lima on 27/10/25.
//

import SwiftUI

struct TaskCardMedium: View {
    var task: Task
    var baseColor: String
    
    var dateEquals: Bool {
        if task.todoDateStart == task.todoDateEnd {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        HStack {
            if dateEquals {
                VStack {
                    Text("\(task.todoDateEnd.format("HH:mm"))")
                }
                .frame(width: 60, height: 50)
                .font(.caption)
                .foregroundStyle(.black)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(Color(baseColor))
                )
                .accessibilityLabel(Text("Horário da tarefa: \(task.todoDateEnd.format("HH:mm"))"))
                
            } else {
                VStack(spacing: 20) {
                    Text("\(task.todoDateStart.format("HH:mm"))")
                        .accessibilityLabel(Text("Horário de início da tarefa:\(task.todoDateStart.format("HH:mm"))"))
                    
                    Text("\(task.todoDateEnd.format("HH:mm"))")
                        .accessibilityLabel(Text("Horário de término da tarefa:\(task.todoDateStart.format("HH:mm"))"))
                }
                .frame(width: 60, height: 75)
                .font(.caption)
                .foregroundStyle(.black)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(Color(baseColor))
                )
            }
            
            HStack (spacing: 0){
                Image(systemName: task.symbol)
                    .font(.title3)
                    .foregroundStyle(.black)
                    .padding(.leading, 12)
                    .accessibilityLabel(Text("Símbolo da Tarefa: \(task.symbol)"))
                
                Text(task.taskTitle)
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .padding(.leading, 10)
                    .accessibilityLabel(Text("Título da tarefa: \(task.taskTitle)"))
                
                Spacer()
                
                completionButton(task: task, baseColor: baseColor)
                    .accessibilityLabel(Text("Botão para completar tarefa"))
            }
            .padding(.vertical, dateEquals ? 12 : 25)
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

struct completionButton: View {
    var task: Task
    var baseColor: String
    
    var body: some View {
        if !task.isCompleted {
            Circle()
                .stroke(Color(baseColor), lineWidth: 2)
                .frame(width: 19, height: 19)
                .padding(.trailing, 20)
                .onTapGesture {
                    withAnimation(.snappy) {
                        task.isCompleted.toggle()
                    }
                }
                .accessibilityLabel(Text("Tarefa não completada"))
        }
        else {
            Circle()
                .fill(Color(baseColor))
                .frame(width: 19, height: 19)
                .padding(.trailing, 20)
                .onTapGesture {
                    withAnimation(.snappy) {
                        task.isCompleted.toggle()
                    }
                }
                .accessibilityLabel(Text("Tarefa completada"))
        }
    }
}

//#Preview {
//    TaskCardMedium(task: Task(taskTitle: "Título", todoDateStart: Date.now, todoDateEnd: Date.now, isCompleted: false, tint: "azul", notes: "descrição", symbol: "bus.fill"), baseColor: .yellow)
//}
