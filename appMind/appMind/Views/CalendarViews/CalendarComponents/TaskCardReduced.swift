//
//  TaskCardReduced.swift
//  appMind
//
//  Created by Dayô Araújo on 28/10/25.
//

import SwiftUI

struct TaskCardReduced: View {
    var task: Task
    var baseColor: Color

    var body: some View {
        HStack {
            Image(systemName: task.symbol)
                .font(.title3)
                .foregroundStyle(.black)
                .frame(width: 60, height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(baseColor)
                )
            
            HStack (spacing: 0){
                Text(task.taskTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .padding(.leading, 10)
                
                Spacer()
                
                completionButton(task: task, baseColor: baseColor)
            }
            .padding(.vertical, 15)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(baseColor, lineWidth: 2)
                    .fill(baseColor.opacity(0.15))
            )
        }
        .padding(.horizontal, 15)
        .strikethrough(task.isCompleted, pattern: .solid, color: .black)
    }
}

#Preview {
    TaskCardReduced(task: Task(taskTitle: "Título", todoDateStart: Date.now, todoDateEnd: Date.now, isCompleted: false, tint: "azul", notes: "descrição", symbol: "bus.fill"), baseColor: .yellow)
}
