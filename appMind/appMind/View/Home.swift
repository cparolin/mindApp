//
//  Home.swift
//  TodoPOC
//
//  Created by André Contarelli Lima on 06/10/25.
//
import SwiftData
import SwiftUI

struct Home: View {
    
    @Query(sort: \Task.todoDate) var tasks: [Task]
    @State private var currentDate: Date = Date()
    @State private var weekSlider: [[Date.WeekDay]] = []
    @State private var currentWeekIndex: Int = 0
    @State private var tasks1: [Task] = []/*sampleTasks.sorted(by: { $1.todoDate < $0.todoDate})*/// Futuramente alterado pelo usuario e com SwiftData
    @State private var createNewTask: Bool = false
    @State private var newTask: Task = Task(taskTitle: "", todoDate: Date(), isCompleted: false, tint: "", notes: "")
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            VStack(alignment: .center, spacing: 6) {
                //            HStack(spacing: 5) {
                //                Text(currentDate.format("MMMM"))
                //                    .foregroundStyle(.blue)
                //                Text(currentDate.format("YYYY"))
                //                    .foregroundStyle(.gray)
                //            }
                //            .font(.title.bold())
                
                Text(Date().format("dd MMMM YYYY"))
                    .font(.title)
                    .fontWeight(.semibold)
                    .textScale(.secondary)
                    .foregroundStyle(.gray)
                TabView(selection: $currentWeekIndex) {
                    ForEach(weekSlider.indices, id: \.self){ index in
                        let week = weekSlider[index]
                        HStack(spacing: 0) {
                            ForEach(week) { day in
                                VStack {
                                    Text(day.date.format("E"))
                                        .font(.callout)
                                        .fontWeight(.medium)
                                        .textScale(.secondary)
                                        .foregroundStyle(.gray)
                                    
                                    Text(day.date.format("d"))
                                        .font(.callout)
                                        .fontWeight(.bold)
                                        .textScale(.secondary)
                                        .foregroundStyle(isSameDate(day.date, currentDate) ? .white : .gray)
                                        .frame(width: 35, height: 35)
                                    // quando outra data é selecionada o fundo fica com outra cor, destacando o dia
                                        .background(content: {
                                            if isSameDate(day.date, currentDate) {
                                                Circle()
                                                    .fill(.blue)
                                            }
                                        })
                                        .background(.white.shadow(.drop(radius: 1)), in: .circle) // deixa o numero dos dias com a borda circulae
                                }
                                .hSpacing(.center)
                                .onTapGesture {
                                    // Fazendo o update da data atual (animaçao pode ser colocada aqui)
                                    currentDate = day.date
                                }
                            }
                        }
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(height: 90)
            }
            .padding(16)
            .hSpacing(.leading)
            
            Text("Rotina do dia")
                .fontWeight(.semibold)
                .font(.title3)
                .padding(.leading, 16)
            
            Label("", systemImage: "sun.max")
                .font(.title3)
                .padding(.leading, 32)
                .padding(.top, 8)
            //Visualização das tarefas
            ScrollView(.vertical) {
                VStack {
                    VStack(alignment: .leading, spacing: 35) {
                        
                        ForEach(tasks) { task in
                            if isSameDate(task.todoDate, currentDate) {
                                HStack(alignment: .top, spacing: 15) {
                                    HStack(spacing: 8, content: {
                                        Text("\(task.todoDate.format("HH:mm"))")
                                            .font(.caption)
                                            .foregroundStyle(.black)
                                            .padding(.trailing, 50)
                                        Text(task.taskTitle)
                                            .fontWeight(.semibold)
                                            .foregroundStyle(.black)
                                            .hSpacing(.leading)
                                        Circle()
                                        //                                        .fill(.cyan)
                                            .frame(width: 10, height: 10)
                                            .padding(4)
                                            .background(.white.shadow(.drop(color: .black.opacity(0.1), radius: 3)), in : .circle)
                                            .overlay {
                                                Circle()
                                                    .frame(width: 50, height: 50)
                                                    .blendMode(.destinationOver)
                                                    .onTapGesture {
                                                        withAnimation(.snappy) {
                                                            task.isCompleted.toggle()
                                                        }
                                                    }
                                            }
                                        
                                    })
                                    .padding(16)
                                    .hSpacing(.leading)
                                    .background(CorTarefa(rawValue: task.tint)?.color ?? .blue, in: .rect(topLeadingRadius: 16, bottomLeadingRadius: 16, bottomTrailingRadius: 16, topTrailingRadius: 16))
                                    .strikethrough(task.isCompleted, pattern: .solid, color: .black)
                                    .offset(y: -8)
                                }
                                
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 15)
                }
                .hSpacing(.center)
                .vSpacing(.center)
            }
            .scrollIndicators(.hidden)
        })
        .vSpacing(.top)
        .overlay(alignment: .bottomTrailing, content: {
            Button(action: {
                createNewTask.toggle()
            }, label: {
                Image(systemName: "plus")
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 55, height: 55)
                    .background(.blue, in: .circle)
            })
            .padding(16)
        })
        .onAppear {
            if weekSlider.isEmpty {
                let currentWeek = Date().fetchWeek()
                weekSlider.append(currentWeek)
            }
        }
        .sheet(isPresented: $createNewTask) {
            NewTaskView(newTask: $newTask)
                .presentationDetents([.height(585)])
//                .interactiveDismissDisabled()
                .presentationCornerRadius(30)
            //                .background(.white)
        }
    }
}
#Preview {
    ContentView()
}
