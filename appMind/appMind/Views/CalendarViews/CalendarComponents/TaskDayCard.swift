//
//  TaskDayCard.swift
//  appMind
//
//  Created by André Contarelli Lima on 27/10/25.
//

import SwiftUI

struct TaskDayCard: View {
    var task: TaskDay
    var body: some View {
        HStack(alignment: .top) {
            HStack(spacing: 4, content: {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 56, height: 74)
                        .foregroundStyle(.clear)
                        .background(CorTarefa(rawValue: task.tintDay)?.color ?? .blue, in: .rect(topLeadingRadius: 16, bottomLeadingRadius: 16, bottomTrailingRadius: 16, topTrailingRadius: 16))
                    
                    Text("\(task.todoDateDay.format("HH:mm"))")
                        .font(.caption)
                        .foregroundStyle(.black)
                    //                                                    .padding(.trailing, 50)
                    
                }
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(CorTarefa(rawValue: task.tintDay)?.color ?? .blue)
                        .frame(width: 310, height: 74)
                        .foregroundStyle(.clear)
                        .background(CorTarefa(rawValue: task.tintDay)?.color.opacity(0.5) ?? .blue, in: .rect(topLeadingRadius: 16, bottomLeadingRadius: 16, bottomTrailingRadius: 16, topTrailingRadius: 16))
                    
                    Text(task.taskTitleDay)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                        .hSpacing(.leading)
                        .padding(.leading, 16)
                    
                }
            })
            //                                        .padding(16)
            .hSpacing(.leading)
            .offset(y: -8)
        }
    }
}
