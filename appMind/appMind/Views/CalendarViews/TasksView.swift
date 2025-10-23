//
//  TaskDayView.swift
//  appMind
//
//  Created by André Contarelli Lima on 23/10/25.
//

import SwiftData
import SwiftUI

struct TasksView: View {
    
    @Query(sort: \TaskDay.todoDateDay) var tasksDay: [TaskDay]
    @Query(sort: \Task.todoDateStart) var tasks: [Task]
    
    @State private var currentDate: Date = Date()
    
    var body: some View {
            ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 14) {
                            ForEach(tasksDay) { task in
                                HStack(alignment: .top, spacing: 15) {
                                    HStack(spacing: 8, content: {
                                        Text("\(task.todoDateDay.format("HH:mm"))")
                                            .font(.caption)
                                            .foregroundStyle(.black)
                                            .padding(.trailing, 50)
                                        Text(task.taskTitleDay)
                                            .fontWeight(.semibold)
                                            .foregroundStyle(.black)
                                            .hSpacing(.leading)
                                    })
                                    .padding(16)
                                    .hSpacing(.leading)
                                    .background(CorTarefa(rawValue: task.tintDay)?.color ?? .blue, in: .rect(topLeadingRadius: 16, bottomLeadingRadius: 16, bottomTrailingRadius: 16, topTrailingRadius: 16))
                                    .offset(y: -8)
                                }
                            }
                        
                        Label("", systemImage: "sun.max")
                            .font(.title3)
                            .padding(.leading, 32)
                            .padding(.top, 8)
                            .hSpacing(.leading)
                        //Cards
                        ForEach(tasks) { task in
                            if isSameDate(task.todoDateStart, currentDate) {
                                HStack(alignment: .top, spacing: 15) {
                                    HStack(spacing: 8, content: {
                                        VStack {
                                            Text("\(task.todoDateStart.format("HH:mm"))")
                                                .font(.caption)
                                                .foregroundStyle(.black)
                                                .padding(.trailing, 50)
                                            Text("\(task.todoDateEnd.format("HH:mm"))")
                                                .font(.caption)
                                                .foregroundStyle(.black)
                                                .padding(.trailing, 50)
                                        }
                                        Text(task.taskTitle)
                                            .fontWeight(.semibold)
                                            .foregroundStyle(.black)
                                            .hSpacing(.leading)
                                        if !task.isCompleted {
                                            Circle()
                                                .stroke(.black, lineWidth: 1)
                                                .frame(width: 19, height: 19)
                                                .padding(4)
                                                .onTapGesture {
                                                    withAnimation(.snappy) {
                                                        task.isCompleted.toggle()
                                                    }
                                                }
                                        }
                                        else {
                                            Circle()
                                                .fill(.black)
                                                .frame(width: 19, height: 19)
                                                .padding(4)
                                                .onTapGesture {
                                                    withAnimation(.snappy) {
                                                        task.isCompleted.toggle()
                                                    }
                                                }
                                        }
                                    })
                                    .padding(16)
                                    .hSpacing(.leading)
                                    .background(CorTarefa(rawValue: task.tint)?.color ?? .blue, in: .rect(topLeadingRadius: 16, bottomLeadingRadius: 16, bottomTrailingRadius: 16, topTrailingRadius: 16))
                                    .strikethrough(task.isCompleted, pattern: .solid, color: .black)
                                    .offset(y: -8)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 15)
                    .hSpacing(.center)
                    .vSpacing(.center)
                }
            .scrollIndicators(.hidden)
            }
            
        }
