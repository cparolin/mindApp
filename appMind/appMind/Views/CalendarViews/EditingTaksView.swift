//
//  EditingTaksView.swift
//  appMind
//
//  Created by Lucca Pivoto on 17/10/25.
//

import SwiftData
import SwiftUI
///Precisa garantir a trocva de cor, não está funcionando
struct EditingTaskView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) var modelContext
    @Query var tasks: [Task]
    @State var enunToString: EnunsCreateEditTaskVIew = EnunsCreateEditTaskVIew()
    @State var taskBeengEditing: Task
    @State var selectedColor: Color = .yellow
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 15, content: {
                VStack(alignment: .leading, spacing: 8, content: {
                    
                    TextField("Nome do evento", text: $taskBeengEditing.taskTitle)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 16)
                        .font(.title)
                    
                    TextField("Notas", text: $taskBeengEditing.notes)
                        .padding(.horizontal, 16)
                })
                Divider()
                .padding(.top, 4)
                
                VStack(spacing: 16) {
                    VStack(alignment: .leading, spacing: 8, content: {
                        Text("Data da tarefa")
                            .font(.caption)
                            .foregroundStyle(.gray)
                        
                        DatePicker("", selection: $taskBeengEditing.todoDateStart)
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
//                                            $taskBeengEditing.taskColor = enunToString.corPasta(selectedColor)
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
                        do{
                           try modelContext.save()
                        }
                        catch let error{
                            print(error.localizedDescription)
                        }
                        dismiss()
                    }, label: {
                        Text("Salvar")
                    })
//                    .disabled(taskTitle == "" || taskNote == "")
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

