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
                VStack(spacing: 20) {
                    Text("\(task.todoDateEnd.format("HH:mm"))")
                }
                .frame(width: 60, height: 50)
                .font(.caption)
                .foregroundColor(.text)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(Color(baseColor))
                )
            } else {
                VStack(spacing: 20) {
                    Text("\(task.todoDateStart.format("HH:mm"))")
                    
                    Text("\(task.todoDateEnd.format("HH:mm"))")
                }
                .frame(width: 60, height: 75)
                .font(.caption)
                .foregroundColor(.text)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(Color(baseColor))
                )
            }
            
            HStack (spacing: 0){
                Image(systemName: task.symbol)
                    .font(.title3)
                    .foregroundColor(.text)
                    .padding(.leading, 12)
                
                Text(task.taskTitle)
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(.text)
                    .padding(.leading, 10)
                
                Spacer()
                
                completionButton(task: task, baseColor: baseColor)
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
        }
    }
}

//#Preview {
//    TaskCardMedium(task: Task(taskTitle: "Título", todoDateStart: Date.now, todoDateEnd: Date.now, isCompleted: false, tint: "azul", notes: "descrição", symbol: "bus.fill"), baseColor: .yellow)
//}
