//
//  TaskCardExpanded.swift
//  appMind
//
//  Created by Dayô Araújo on 28/10/25.
//

import SwiftUI

struct TaskCardExpanded: View {
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
                .frame(width: 60, height: 83)
                .font(.caption)
                .foregroundStyle(.black)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(Color(baseColor))
                )
            } else {
                VStack(spacing: 20) {
                    Text("\(task.todoDateStart.format("HH:mm"))")
                    
                    Text("\(task.todoDateEnd.format("HH:mm"))")
                }
                .frame(width: 60, height: 83)
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
                
                VStack (alignment: .leading, spacing: 5){
                    Text(task.taskTitle)
                        .lineLimit(1)
                        .truncationMode(.tail)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                        .padding(.leading, 10)
                    
                    Text(task.notes)
                        .lineLimit(1)
                        .truncationMode(.tail)
                        .font(.footnote)
                        .foregroundStyle(.black)
                        .padding(.leading, 10)
                }
                
                Spacer()
                
                completionButton(task: task, baseColor: baseColor)
            }
            .padding(.vertical, 20)
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
//    TaskCardExpanded(task: Task(taskTitle: "Título", todoDateStart: Date.now, todoDateEnd: Date.now, isCompleted: false, tint: "azul", notes: "descrição", symbol: "bus.fill"), baseColor: .yellow)
//}
