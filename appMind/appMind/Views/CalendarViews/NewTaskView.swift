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
    @State private var taskDate: Date = Date()
    @State private var taskColor: String = ""
    @State private var selectedColor: Color = .yellow
    @State private var selection: String = "t"
    
    @Binding var newTask: Task
    
    @Query var tasks: [Task]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
                VStack(alignment: .leading, spacing: 15, content: {
                    VStack(alignment: .leading, spacing: 8, content: {
                        TextField("Nome do evento", text: $taskTitle)
                            .padding(.vertical, 12)
                            .font(.title2)
                            .fontWeight(.semibold)
                            
                        TextField("Notas", text: $taskNote)
                            .font(.body)
                    })
                    Divider()
                        .padding(.top, 4)
                    
                    VStack(spacing: 16) {
                        VStack(alignment: .leading, spacing: 8, content: {
                            Text("Data da tarefa")
                                .font(.caption)
                                .foregroundStyle(.gray)
                            
                            DatePicker("", selection: $taskDate)
                                .datePickerStyle(.compact)
                                .scaleEffect(0.9, anchor: .leading)
                        })
                        .padding(.top, 4)
                        // Maior espaco para clicar nas cores
                        .padding(.trailing, -15)
                        
                        VStack(alignment: .leading, spacing: 8, content: {
                            Text("Cor da tarefa")
                                .font(.caption)
                                .foregroundStyle(.gray)
                            
                            PickerColorComponent(selectedColor: $selectedColor, taskColor: $taskColor)
                        })
                        .padding(.top, 4)
                    }
                })
                
                .padding(.horizontal, 16)
//                .ignoresSafeArea()
                .vSpacing(.top)
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
                    }
                    ToolbarItem(placement: .confirmationAction){
                        Button(action: {
                            newTask = Task(taskTitle: "\(taskTitle)", todoDate: taskDate, isCompleted: false, tint: "\(taskColor)", notes: "\(taskNote)")
                            modelContext.insert(newTask)
                            dismiss()
                        }, label: {
                            Text("OK")
                        })
                        .disabled(taskTitle == "" || taskNote == "")
                    }
                    
                }
                
            }
        .overlay(Picker("", selection: $selection){
            Text("Tarefa").tag("t")
            Text("Lembrete").tag("l")
        }
            .pickerStyle(.segmented)
            .padding(.top, 60)
            .padding(.horizontal, 16)
                 , alignment: .top)
        }
    }

#Preview {
    NewTaskView(newTask: .constant(Task(taskTitle: "titulo", todoDate: Date(), isCompleted: false, tint: "azul", notes: "notas")))
}
