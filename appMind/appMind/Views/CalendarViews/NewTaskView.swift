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
    @State var tempSelectedIcon: String = "square.and.pencil"
    @State var descLength: Int = 35
    
    var currentDate: Date
    
    var descCountdown: Int {
        descLength - taskNote.count
    }
    
    @Query var tasks: [Task]
    @Query var tasksDay: [TaskDay]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            VStack (spacing: 20) {
                HStack (spacing: 15) {
                    Button {
                        symbolsPicker.toggle()
                        
                    } label : {
                        Image(systemName: "\(tempSelectedIcon)")
                            .font(.largeTitle)
                            .foregroundColor(.accentColor)
                    }
                    
                    TextField("Nome do evento", text: $taskTitle)
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                
                VStack (spacing: 10){
                    TextField("Notas", text: $taskNote)
                        .onReceive(Just(taskNote)) {
                            taskNote = String($0.prefix(descLength))
                        }
                    
                    Divider()
                    
                    Text("\(descCountdown)/\(descLength)")
                        .font(.caption2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.cinza3)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                HStack {
                    Text("Dia inteiro")
                    Toggle("", isOn: $isEnabled)
                }.padding(.vertical, 5)
                
                HStack {
                    Text("Começa")
                    
                    Spacer()
                    
                    DatePicker("", selection: $taskDateStart, in: currentDate...)
                        .datePickerStyle(.compact)
                        .disabled(isEnabled)
                }
                
                HStack {
                    Text("Termina")
                    
                    Spacer()
                    
                    DatePicker("", selection: $taskDateStart, in: currentDate...)
                        .datePickerStyle(.compact)
                        .disabled(isEnabled)
                }
                
                Text("Cor da tarefa")
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ColorPickerComponent(taskColor: $taskColor, palette: paletteLayout)
                
                Spacer()
            }
            .padding(.top, 20)
            .onTapGesture {
                self.hideKeyboard()
            }
            .padding(.horizontal, 16)
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
                        if isEnabled {
                            let newTaskDay = TaskDay(taskTitleDay: "\(taskTitle)", todoDateDay: currentDate, tintDay: "\(taskColor)", notesDay: "\(taskNote)", symbolDay: "\(tempSelectedIcon)")
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
            .navigationBarTitleDisplayMode(.inline)
            .ignoresSafeArea(.keyboard)
        }
        .sheet(isPresented: $symbolsPicker) {
            SymbolsPickerView(tempSelectedIcon: $tempSelectedIcon)
                .presentationDetents([.height(345)])
                .interactiveDismissDisabled()
        }
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    NewTaskView(currentDate: Date.now)
}
