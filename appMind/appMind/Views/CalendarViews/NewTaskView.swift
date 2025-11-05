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
    @State var descLength: Int = 35
    
    var descCountdown: Int {
        descLength - taskNote.count
    }
    
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
                                        .font(.largeTitle)
                                        .foregroundStyle(.gray)
                                } else {
                                    Image(systemName: "\(tempSelectedIcon)")
                                        .font(.largeTitle)
                                        .foregroundStyle(.gray)
                                }
                            }
                            .padding(5)
                            
                            TextField("Nome do evento", text: $taskTitle)
                                .padding(.vertical, 12)
                                .font(.title)
                                .fontWeight(.semibold)
                        }
                        TextField("Notas", text: $taskNote)
                            .onReceive(Just(taskNote)) {
                                taskNote = String($0.prefix(descLength))
                            }

                    })
                    Divider()
                        .padding(.top, 4)
                    
                    Text("\(descCountdown)/\(descLength)")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(.cinza3)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.bottom, 5)
            
                    VStack(spacing: 16) {
                        HStack {
                            Text("Dia inteiro")
                                .foregroundStyle(.black)
                            
                            Toggle("", isOn: $isEnabled)
                                .padding(.trailing, 16)
                        }
                        HStack(content: {
                            
                            Text("Começa")
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
                        .disabled(taskTitle == "" || tempSelectedIcon == "")
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
