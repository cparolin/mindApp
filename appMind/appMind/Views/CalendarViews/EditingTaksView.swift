//
//  EditingTaksView.swift
//  appMind
//
//  Created by Lucca Pivoto on 17/10/25.
//

import SwiftData
import SwiftUI
import Combine

///Precisa garantir a trocva de cor, não está funcionando
struct EditingTaskView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) var modelContext
    @State var enunToString: EnunsCreateEditTaskVIew = EnunsCreateEditTaskVIew()
    @AppStorage("paletteLayout") private var paletteLayout: String = "Saturadas"
    @State var taskBeengEdit: Task
    @State var presentConfirmation: Bool = false
    @State var tempColor: String = "abanana"
    @State var tempColorTratada: String = "error"
    @State var localNotes: String = "Teste"
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 15, content: {
                ZStack(){
                    TheTaksBlockView(task: $taskBeengEdit, cor: $tempColorTratada)
                    HStack(){
                        VStack(alignment: .leading){
                            HStack(){
                                Text(" ")
                                    .frame(width: 36 , height: 43)
                                
                            }
                        }
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal , 16)
                }
                VStack(spacing: 16) {
                    VStack(alignment: .leading, spacing: 8, content: {
                        Text("Data da tarefa")
                            .font(.caption)
                            .foregroundStyle(.gray)
                            .accessibilityLabel(Text("Data da tarefa"))
                        
                        HStack(){
                            Text("Começa")
                                .accessibilityLabel(Text("Data de início da tarefa"))
                            DatePicker("", selection: $taskBeengEdit.todoDateStart)
                                .datePickerStyle(.compact)
                                .scaleEffect(0.9, anchor: .leading)
                        }
                        HStack(){
                            Text("Termina")
                                .accessibilityLabel(Text("Data de término da tarefa"))
                            DatePicker("", selection: $taskBeengEdit.todoDateEnd)
                                .datePickerStyle(.compact)
                                .scaleEffect(0.9, anchor: .leading)
                        }
                        
                    })
                    .padding(.top, 4)
                    // Maior espaco para clicar nas cores
                    .padding(.trailing, -15)
                    
                    VStack(alignment: .leading, spacing: 8, content: {
                        Text("Cor da tarefa")
                            .font(.caption)
                            .foregroundStyle(.gray)
                            .accessibilityLabel(Text("Cor da tarefa"))
                        
                        HStack(spacing: 0) {
                                ColorPickerComponent(taskColor: $tempColor, palette: paletteLayout)
                        }
                        Spacer()
                        Button(role: .destructive){
                            presentConfirmation.toggle()
                        } label: {
                            Text("Excluir evento")
                                .font(.subheadline)
                                .bold()
                                .hSpacing(.center)
                        }
                        .accessibilityLabel(Text("Botão para deletar tarefa"))
                        .confirmationDialog("Você tem certeza que deseja excluir esse evento ?", isPresented: $presentConfirmation , titleVisibility: .visible){
                            Button("Sim" , role: .destructive){
                                modelContext.delete(taskBeengEdit)
                                do{
                                    try modelContext.save()
                                }
                                catch let error{
                                    print(error.localizedDescription)
                                }
                                dismiss()
                            }
                        }
                    })
                    .padding(.top, 4)
                }
            })
            .padding(16)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("\(taskBeengEdit.taskTitle)")
                }
                ToolbarItem(placement: .confirmationAction){
                    Button(action: {
                        do{
                            taskBeengEdit.tint = tempColor
                            try modelContext.save()
                        }
                        catch let error{
                            print(error.localizedDescription)
                        }
                        dismiss()
                    }, label: {
                        Text("OK")
                    })
                    .disabled(taskBeengEdit.taskTitle == "" || taskBeengEdit.notes == "" ? true : false)
                    .accessibilityLabel(Text("Botão para salvar modificações"))
                }
            }
        }
        .onChange(of: tempColor){
            withAnimation(){
                tempColorTratada = getPaletteColor(palette: paletteLayout, color: tempColor)
            }
        }
        .onAppear {
            tempColor = taskBeengEdit.tint
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

#Preview {
    EditingTaskView(taskBeengEdit: Task(taskTitle: "sdajnds", todoDateStart: Date(), todoDateEnd: Date(), isCompleted: false, tint: "red", notes: "hsdhjadg", symbol: "plus"))
}
