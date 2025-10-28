//
//  TaskDayView.swift
//  appMind
//
//  Created by André Contarelli Lima on 23/10/25.
//

import SwiftData
import SwiftUI

struct TasksView: View {
    
    var tasksDay: [TaskDay]
    var tasks: [Task]
    
    @Binding var currentDate: Date 
    
    
    var body: some View {
        
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(tasksDay) { task in
                        if isSameDate(task.todoDateDay, currentDate) {
                            TaskDayCard(task: task)
                        }
                        else {
                            Text("Sem tarefas para hoje")
                        }
                    }
                    .padding(.top, 16)
                    
                    Text("Rotina do dia")
                        .fontWeight(.semibold)
                        .font(.title3)
                        .hSpacing(.leading)
                    //                    .padding(.leading, 16)
                    //                            .padding(.top, 16)
                    
                    //Cards
                    ForEach(tasks) { task in
                        if isSameDate(task.todoDateStart, currentDate) {
                            TaskCard(task: task)
                        }
                        else {
                            Text("Sem tarefas para hoje")
                        }
                    }
                    .padding(.top, 16)
                    
                    
                }
                .padding(.horizontal, 16)
                .padding(.top, 15)
                .hSpacing(.center)
                .vSpacing(.center)
            }
            .scrollIndicators(.hidden)
        }
    }
