//
//  TaskCardReduced.swift
//  appMind
//
//  Created by Dayô Araújo on 28/10/25.
//

import SwiftUI

struct TaskCardReduced: View {
    @AppStorage("font") private var font = "SF Pro"
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
            
            HStack (spacing: 0){
                Text(task.taskTitle)
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .font(.changeFont(fontType: font, fontStyle: .body, fontWeight: isOpenDyslexic(font: font) ? .bold : .semibold))
                    .foregroundStyle(.black)
                    .padding(.leading, 10)
                
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
