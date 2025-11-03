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
    @State var rectangleX: CGFloat = 361
    @State var rectangleY: CGFloat = 129
    var body: some View {
        VStack(){
            ZStack(){
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(Color(cor).opacity(0.4))
                    .frame(width: rectangleX , height: rectangleY)
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color(cor), lineWidth: 2)
                    .frame(width: rectangleX , height: rectangleY)
                HStack(alignment: .top){
                    VStack(){
                        HStack(){
                            ZStack(){
                                //O retangulo amalgma
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
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 40)
                                    }
                            }
                            TextField("Nome do evento", text: $task.taskTitle)
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        Spacer()
                        HStack(){
                            VStack(alignment: .leading){
                                
                                Text("Notas")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                TextField("Notas", text: $task.notes , axis: .vertical)
                                    .font(.callout)
                                    .fontWeight(.regular)
                                //                                .onReceive(Just(taskBeengEdit.taskTitle)) { note in
                                //                                    taskBeengEdit.taskTitle = String(note.prefix(notesLength))
                                //                                }
                                Spacer()
                            }
                            .padding(.leading , 12)
                        }
                    }
                    Spacer()
                }
            }
            .frame(width: 361 , height: rectangleY)
        }
        .onAppear(){
            print("\(cor)")
        }
    }
}

//#Preview {
//    TheTaksBlockView(task: Task(taskTitle: "sdajnds", todoDateStart: Date(), todoDateEnd: Date(), isCompleted: false, tint: "red", notes: "hsdhjadg") , taskColor: .green)
//}
