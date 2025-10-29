//
//  TaskDayCard.swift
//  appMind
//
//  Created by André Contarelli Lima on 27/10/25.
//

import SwiftUI

struct TaskDayCardReduced: View {
    var task: TaskDay
    var baseColor: Color
    
    var body: some View {
        HStack {
            Image(systemName: "bus.fill")
                .font(.title3)
                .foregroundStyle(.black)
                .frame(width: 60, height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(baseColor)
                )
            
            HStack (spacing: 0){
                Text(task.taskTitleDay)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .padding(.leading, 10)
                
                Spacer()
            }
            .padding(.vertical, 15)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(baseColor, lineWidth: 2)
                    .fill(baseColor.opacity(0.15))
            )
        }
        .padding(.horizontal, 15)
    }
}
