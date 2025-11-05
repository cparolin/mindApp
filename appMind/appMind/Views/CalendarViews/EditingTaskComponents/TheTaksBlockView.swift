//
//  TheTaksBlockView.swift
//  appMind
//
//  Created by Lucca Pivoto on 28/10/25.
//

import SwiftUI
//
struct TheTaksBlockView: View {
    @Binding var task: Task
    @Binding var cor: String
    @State var width: CGFloat = UIScreen.main.bounds.width * 0.9
    @State var height: CGFloat = UIScreen.main.bounds.height * 0.17
    @State var descLength: Int = 35
    @State var isPresented: Bool = false
    
    var body: some View {
        ZStack(){
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(cor), lineWidth: 2)
                .fill(Color(cor).opacity(0.4))
                .frame(width: width, height: height)
            
            HStack {
                RoundedRectangle(cornerRadius: 0)
                    .clipShape(
                        .rect(
                            topLeadingRadius: 16 ,
                            bottomLeadingRadius: 0 ,
                            bottomTrailingRadius: 16,
                            topTrailingRadius: 0 ,
                            
                        )
                    )
                    .foregroundStyle(Color(cor))
                    .frame(width: 52 , height: 69)
                    .overlay {
                        Button {
                            isPresented.toggle()
                        } label: {
                            if task.symbol == "" {
                                Image(systemName: "questionmark")
                                    .font(.title)
                                    .foregroundColor(.black)
                            } else {
                                Image(systemName: task.symbol)
                                    .font(.title)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                
                TextField("Título do Evento", text: $task.taskTitle)
                    .font(.title2)
                    .bold()
                
                Spacer()
            }
            .padding(.bottom, height * 0.52)
            
            VStack (alignment: .leading) {
                Text("Notas")
                    .font(.footnote)
                    .bold()
                
                TextField("Descrição breve sobre o evento", text: $task.notes)
                    .onChange(of: task.notes) { newValue in
                        if newValue.count > descLength {
                            task.notes = String(newValue.prefix(descLength))
                        }
                    }
                    .font(.callout)
                    .padding(.leading)
            }
            .padding(.top, height * 0.46)
            .frame(width: width * 0.95)
        }
        .frame(width: width, height: height)
        .sheet(isPresented: $isPresented) {
            SymbolsPickerView(tempSelectedIcon: $task.symbol)
        }
    }
}

//#Preview {
//    TheTaksBlockView(task: Task(taskTitle: "sdajnds", todoDateStart: Date(), todoDateEnd: Date(), isCompleted: false, tint: "red", notes: "hsdhjadg") , taskColor: .green)
//}
