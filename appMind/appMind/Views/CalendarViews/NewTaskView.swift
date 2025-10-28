//
//  NewTaskView.swift
//  TodoPOC
//
//  Created by André Contarelli Lima on 08/10/25.
//
import SwiftData
import SwiftUI

struct NewTaskView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var taskTitle: String = ""
    @State private var taskNote: String = ""
    @State private var taskDateStart: Date = Date()
    @State private var taskDateEnd: Date = Date()
    @State private var taskDate: Date = Date()
    @State private var taskColor: String = ""
    @State private var selectedColor: Color = .white
    @State private var selection: String = "t"
    @State private var isEnabled = false
    
//    @Binding var newTask: Task
//    @Binding var newTaskDay: TaskDay
    
    @Query var tasks: [Task]
    @Query var tasksDay: [TaskDay]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
                VStack(alignment: .leading, spacing: 15, content: {
                    VStack(alignment: .leading, spacing: 8, content: {
                        TextField("Nome do evento", text: $taskTitle)
                            .padding(.vertical, 12)
                            .font(.title)
                            .fontWeight(.semibold)
                        TextField("Notas", text: $taskNote)

                    })
                    Divider()
                        .padding(.top, 4)
            
                    VStack(spacing: 16) {
                        HStack {
                            Text("Dia inteiro")
                                .font(.body)
                                .foregroundStyle(.black)
                            
                            Toggle("", isOn: $isEnabled)
                                .padding(.trailing, 16)
                        }
                        HStack(content: {
                            
                            Text("Começa")
                                .font(.body)
                                .foregroundStyle(.black)
                            
                            DatePicker("", selection: $taskDateStart)
                                .datePickerStyle(.compact)
                                .scaleEffect(0.9, anchor: .leading)
                                .disabled(isEnabled)
                        })
                        .opacity(isEnabled ? 0.5 : 1)
                        .padding(.top, 4)
                        .padding(.trailing, -16)
                        
                        HStack(content: {
                            Text("Termina")
                                .font(.body)
                                .foregroundStyle(.black)
                            
                            DatePicker("", selection: $taskDateEnd)
                                .datePickerStyle(.compact)
                                .scaleEffect(0.9, anchor: .leading)
                                .disabled(isEnabled)
                        })
                        .padding(.trailing, -16)
                        .opacity(isEnabled ? 0.5 : 1)
                        
                        VStack(alignment: .leading, spacing: 8, content: {
                            Text("Cor da tarefa")
                                .font(.caption)
                                .foregroundStyle(.gray)
                            
                            ColorPickerComponent(selectedColor: $selectedColor, taskColor: $taskColor)
                        })
                        .padding(.top, 4)
                    }
                })
//                .padding(.top, 70)
                .padding(.horizontal, 16)
                .vSpacing(.top)
//                .ignoresSafeArea()
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            dismiss()
                        }, label: {
                            Image(systemName: "xmark")
                        })
                    }
                    ToolbarItem(placement: .principal) {
                        Text("Adicionar")
                            .fontWeight(.semibold)
                    }
                    ToolbarItem(placement: .confirmationAction){
                        Button(action: {
                            taskColor = corPasta(selectedColor)
                            if isEnabled {
                                let newTaskDay = TaskDay(taskTitleDay: "\(taskTitle)", todoDateDay: taskDate, tintDay: "\(taskColor)", notesDay: "\(taskNote)")
                                modelContext.insert(newTaskDay)
                            }
                            else {
                                let newTask = Task(taskTitle: "\(taskTitle)", todoDateStart: taskDateStart, todoDateEnd: taskDateEnd, isCompleted: false, tint: "\(taskColor)", notes: "\(taskNote)")
                                modelContext.insert(newTask)
                            }
                            dismiss()
                        }, label: {
                            Text("OK")
                        })
                        .disabled(taskTitle == "" || taskNote == "")
                    }
                }
            }
    }
}
#Preview {
    NewTaskView()
}
