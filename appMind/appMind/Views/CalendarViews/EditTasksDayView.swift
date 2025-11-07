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
struct EditingTasksDayView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) var modelContext
    @State var enunToString: EnunsCreateEditTaskVIew = EnunsCreateEditTaskVIew()
    @AppStorage("paletteLayout") private var paletteLayout: String = "Saturadas"
    @State var taskBeengEdit: TaskDay
    @State var presentConfirmation: Bool = false
    @State var tempColor: String = "abanana"
    @State var tempColorTratada: String = "error"
    @State var localNotes: String = "Teste"
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 15, content: {
                ZStack(){
                    TheTaksDayBlockView(task: $taskBeengEdit, cor: $tempColorTratada)
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
                        
                        HStack {
                            Text("Dia Inteiro")
                            Spacer()
                            Text("\(taskBeengEdit.todoDateDay.format("dd, MMMM YYYY"))")
                                .padding(.trailing, 16)
                        }
                        
                    })
                    .padding(.top, 4)
                    // Maior espaco para clicar nas cores
                    .padding(.trailing, -15)
                    
                    VStack(alignment: .leading, spacing: 8, content: {
                        Text("Cor da tarefa")
                            .font(.caption)
                            .foregroundStyle(.gray)
                        
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
                        .confirmationDialog("Você tem certeza que deseja excluir esse evento?", isPresented: $presentConfirmation , titleVisibility: .visible){
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
                    Text("\(taskBeengEdit.taskTitleDay)")
                }
                ToolbarItem(placement: .confirmationAction){
                    Button(action: {
                        do{
                            taskBeengEdit.tintDay = tempColor
                            try modelContext.save()
                        }
                        catch let error{
                            print(error.localizedDescription)
                        }
                        dismiss()
                    }, label: {
                        Text("OK")
                    })
                    .disabled(taskBeengEdit.taskTitleDay == "" || taskBeengEdit.symbolDay == "" ? true : false)

                }
            }
        }
        .onChange(of: tempColor){
            withAnimation(){
                tempColorTratada = getPaletteColor(palette: paletteLayout, color: tempColor)
            }
        }
        .onAppear {
            tempColor = taskBeengEdit.tintDay
        }
    }
}

#Preview {
    EditingTaskView(taskBeengEdit: Task(taskTitle: "sdajnds", todoDateStart: Date(), todoDateEnd: Date(), isCompleted: false, tint: "red", notes: "hsdhjadg", symbol: "plus"))
}
