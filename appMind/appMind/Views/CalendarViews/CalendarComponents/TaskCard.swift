//
//  TaskCard.swift
//  appMind
//
//  Created by André Contarelli Lima on 27/10/25.
//

import SwiftUI

struct TaskCard: View {
    var task: Task
    var body: some View {
        HStack(alignment: .top) {
            HStack(spacing: 4, content: {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 56, height: 74)
                        .foregroundStyle(.clear)
                        .background(CorTarefa(rawValue: task.tint)?.color ?? .blue, in: .rect(topLeadingRadius: 16, bottomLeadingRadius: 16, bottomTrailingRadius: 16, topTrailingRadius: 16))
                    
                    VStack(spacing: 8) {
                        Text("\(task.todoDateStart.format("HH:mm"))")
                            .font(.caption)
                            .foregroundStyle(.black)
                        //                                                    .padding(.trailing, 50)
                        Text("\(task.todoDateEnd.format("HH:mm"))")
                            .font(.caption)
                            .foregroundStyle(.black)
                        //                                                    .padding(.trailing, 50)
                    }
                }
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(CorTarefa(rawValue: task.tint)?.color ?? .blue)
                        .frame(width: 310, height: 74)
                        .foregroundStyle(.clear)
                        .background(CorTarefa(rawValue: task.tint)?.color.opacity(0.5) ?? .blue, in: .rect(topLeadingRadius: 16, bottomLeadingRadius: 16, bottomTrailingRadius: 16, topTrailingRadius: 16))
                    HStack {
                        Text(task.taskTitle)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                            .hSpacing(.leading)
                            .padding(.leading, 16)
                        
                        if !task.isCompleted {
                            Circle()
                                .stroke(CorTarefa(rawValue: task.tint)?.color ?? .blue, lineWidth: 2)
                                .frame(width: 19, height: 19)
                                .padding(4)
                                .padding(.trailing, 22)
                                .onTapGesture {
                                    withAnimation(.snappy) {
                                        task.isCompleted.toggle()
                                    }
                                }
                        }
                        else {
                            Circle()
                                .fill(CorTarefa(rawValue: task.tint)?.color ?? .blue)
                                .frame(width: 19, height: 19)
                                .padding(4)
                                .padding(.trailing, 22)
                                .onTapGesture {
                                    withAnimation(.snappy) {
                                        task.isCompleted.toggle()
                                    }
                                }
                        }
                    }
                }
            })
            //                                    .padding(16)
            .hSpacing(.leading)
            .strikethrough(task.isCompleted, pattern: .solid, color: .black)
            .offset(y: -8)
        }
    }
}
