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
    @Binding var newTask: Task
    //    @Binding var tasks: [Task]
    
    @Query var tasks: [Task]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 15, content: {
                VStack(alignment: .leading, spacing: 8, content: {
                    
                    TextField("Nome do evento", text: $taskTitle)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 16)
                        .font(.title)
                    
                    TextField("Notas", text: $taskNote)
                        .padding(.horizontal, 16)
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
                        
                        let colors: [Color] = [.blue, .red, .yellow, .orange, .purple, .green]
                        
                        HStack(spacing: 0) {
                            ForEach(colors, id: \.self) { color in
                                Circle()
                                    .fill(color)
                                    .frame(width: 54)
                                    .background(content: {
                                        Circle()
                                            .stroke(.blue, lineWidth: 8)
                                            .stroke(.white, lineWidth: 4)
                                            .opacity(selectedColor == color ? 1 : 0)
                                    })
                                    .hSpacing(.center)
                                    .contentShape(.rect)
                                    .onTapGesture {
                                        withAnimation(.snappy) {
                                            selectedColor = color
                                            taskColor = corPasta(selectedColor)
                                        }
                                    }
                            }
                        }
                    })
                    .padding(.top, 4)
                }
            })
            .padding(16)
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
    }
}

enum CorTarefa: String {
    
    case blue
    case red
    case yellow
    case orange
    case purple
    case gray
    
    var color: Color {
        switch self {
        case .blue:
            return .blue
            
        case .red:
            return .red
            
        case .yellow:
            return .yellow
            
        case .orange:
            return .orange
            
        case .purple:
            return .purple
            
        case .gray:
            return .gray
        }
    }
}

func corPasta(_ cor: Color) -> String {
    var corString: String = "erro"
    switch cor{
    case .yellow:
        corString = "yellow"
    case .blue:
        corString = "blue"
    case .red:
        corString = "red"
    case .orange:
        corString = "orange"
    case .purple:
        corString = "purple"
        
    default:
        corString = "gray"
    }
    return corString
       }

#Preview {
    ContentView()
}
