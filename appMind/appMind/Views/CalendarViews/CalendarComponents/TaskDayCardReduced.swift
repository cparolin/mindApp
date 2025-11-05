//
//  TaskDayCard.swift
//  appMind
//
//  Created by André Contarelli Lima on 27/10/25.
//

import SwiftUI

struct TaskDayCardReduced: View {
    @AppStorage("font") private var font = "SF Pro"
    var task: TaskDay
    var baseColor: String
        
    var body: some View {
        HStack {
            Image(systemName: task.symbolDay)
                .font(.title3)
                .foregroundStyle(.black)
                .frame(width: 60, height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(Color(baseColor))
                )
                .accessibilityLabel(Text("Símbolo da Tarefa: \(task.symbolDay)"))
            
            HStack (spacing: 0){
                Text(task.taskTitleDay)
                    .truncationMode(.tail)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .padding(.leading, 10)
                    .accessibilityLabel(Text("Título da tarefa: \(task.taskTitleDay)"))
                
                Spacer()
            }
            .padding(.vertical, 15)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color(baseColor), lineWidth: 2)
                    .fill(Color(baseColor).opacity(0.15))
            )
        }
        .padding(.horizontal, 15)
    }
}
