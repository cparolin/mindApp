//
//  NewTaskView.swift
//  TodoPOC
//
//  Created by André Contarelli Lima on 08/10/25.
//
import Combine
import SwiftData
import SwiftUI

struct NewTaskView: View {
    
    @AppStorage("paletteLayout") private var paletteLayout: String = "Saturadas"
    
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
    @State private var symbolsPicker = false
    @State var tempSelectedIcon: String = ""
    
//    @Binding var newTask: Task
//    @Binding var newTaskDay: TaskDay
    
    @Query var tasks: [Task]
    @Query var tasksDay: [TaskDay]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
                VStack(alignment: .leading, spacing: 15, content: {
                    VStack(alignment: .leading, spacing: 8, content: {
                        HStack {
                            Button {
                                symbolsPicker.toggle()
                            } label : {
                                if tempSelectedIcon == "" {
                                    Image(systemName: "figure.cross.training")
                                        .resizable()
                                        .frame(width: 30,height: 40)
                                        .foregroundStyle(.gray)
                                } else {
                                    Image(systemName: "\(tempSelectedIcon)")
                                        .resizable()
                                        .frame(width: 30,height: 40)
                                        .foregroundStyle(.gray)
                                }
                            }
                            TextField("Nome do evento", text: $taskTitle)
                                .padding(.vertical, 12)
                                .font(.title)
                                .fontWeight(.semibold)
                        }
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
                            
                            ColorPickerComponent(taskColor: $taskColor, palette: paletteLayout)
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
                            if isEnabled {
                                let newTaskDay = TaskDay(taskTitleDay: "\(taskTitle)", todoDateDay: taskDate, tintDay: "\(taskColor)", notesDay: "\(taskNote)", symbolDay: "\(tempSelectedIcon)")
                                modelContext.insert(newTaskDay)
                            }
                            else {
                                let newTask = Task(taskTitle: "\(taskTitle)", todoDateStart: taskDateStart, todoDateEnd: taskDateEnd, isCompleted: false, tint: "\(taskColor)", notes: "\(taskNote)", symbol: "\(tempSelectedIcon)")
                                modelContext.insert(newTask)
                                print(newTask)
                            }
                            dismiss()
                        }, label: {
                            Text("OK")
                        })
                        .disabled(taskTitle == "" || taskNote == "" || tempSelectedIcon == "")
                    }
                }
        } .sheet(isPresented: $symbolsPicker) {
            SymbolsPickerView(tempSelectedIcon: $tempSelectedIcon)
                .presentationDetents([.height(345)])
                .interactiveDismissDisabled()
        }
    }
}
#Preview {
    NewTaskView()
}
