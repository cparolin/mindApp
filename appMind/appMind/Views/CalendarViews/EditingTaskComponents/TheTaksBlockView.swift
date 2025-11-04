//
//  TheTaksBlockView.swift
//  appMind
//
//  Created by Lucca Pivoto on 28/10/25.
//

import SwiftUI
//
struct TheTaksBlockView: View {
    @AppStorage("font") private var font = "SF Pro"
    @Binding var task: Task
    @Binding var cor: String
    @State var width: CGFloat = UIScreen.main.bounds.width * 0.9
    @State var height: CGFloat = UIScreen.main.bounds.height * 0.17
    
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
                        Image(systemName: task.symbol)
                            .font(.title)
                    }
                
                TextField("Título do Evento", text: $task.taskTitle)
                    .font(.changeFont(fontType: font, fontStyle: .title2, fontWeight: .bold))
                
                Spacer()
            }
            .padding(.bottom, height * 0.52)
            
            VStack (alignment: .leading) {
                Text("Notas")
                    .font(.changeFont(fontType: font, fontStyle: .footnote, fontWeight: .bold))
                
                TextField("Descrição breve sobre o evento", text: $task.notes)
                    .font(.changeFont(fontType: font, fontStyle: .callout, fontWeight: .regular))
                    .padding(.leading)
            }
            .padding(.top, height * 0.46)
            .frame(width: width * 0.95)
        }
        .frame(width: width, height: height)
    }
}

//#Preview {
//    TheTaksBlockView(task: Task(taskTitle: "sdajnds", todoDateStart: Date(), todoDateEnd: Date(), isCompleted: false, tint: "red", notes: "hsdhjadg") , taskColor: .green)
//}
