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
    @State private var createNewTask: Bool = false
    @State private var newTask: Task = Task(taskTitle: "", todoDate: Date(), isCompleted: false, tint: "", notes: "")
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .frame(height: 195)
                    .foregroundStyle(.gray)
                    .vSpacing(.top)
                    .ignoresSafeArea()
                
                VStack(alignment: .center) {
                    Text(Date().format("dd, MMMM YYYY"))
                        .font(.headline)
                        .fontWeight(.semibold)
                        .textScale(.secondary)
                        .foregroundStyle(.white)
                    //                        .border(.red)
                        .padding(.top, 24)
                    TabView(selection: $currentWeekIndex) {
                        ForEach(weekSlider.indices, id: \.self){ index in
                            let week = weekSlider[index]
                            HStack(spacing: 0) {
                                ForEach(week) { day in
                                    VStack {
                                        Text(day.date.format("d"))
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .textScale(.secondary)
                                            .foregroundStyle(isSameDate(day.date, currentDate) ? .white : .gray)
                                            .frame(width: 44, height: 64)
                                        // quando outra data é selecionada o fundo fica com outra cor, destacando o dia
                                            .background(content: {
                                                if isSameDate(day.date, currentDate) {
                                                    Capsule()
                                                        .fill(.blue)
                                                }
                                                else {
                                                    Capsule()
                                                        .fill(.white)
                                                }
                                            })
                                            .background(.white.shadow(.drop(radius: 1)), in: .circle) // deixa o numero dos dias com a borda circular
                                        Text(day.date.format("E"))
                                            .font(.callout)
                                            .fontWeight(.medium)
                                            .textScale(.secondary)
                                            .foregroundStyle(.white)
                                            .padding(.bottom, -20)
                                            .padding(.top, -8)
                                    }
                                    .hSpacing(.center)
                                    .onTapGesture {
                                        // Fazendo o update da data atual (animaçao pode ser colocada aqui)
                                        currentDate = day.date
                                    }
                                }
                            }
                        }
                        .padding(.bottom, 16)
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .frame(height: 90)
                    //                    .border(.green)
                    .vSpacing(.top)
                }
                .padding(.horizontal, 16)
                .hSpacing(.leading)
                Spacer()
                //                .vSpacing(.bottom)
            }
            //            .border(.cyan)
            .frame(height: 150)
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
                    VStack(alignment: .leading, spacing: 14) {
                        //Cards
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
                                        if !task.isCompleted {
                                            Circle()
                                                .stroke(.black, lineWidth: 1)
                                                .frame(width: 19, height: 19)
                                                .padding(4)
                                                .onTapGesture {
                                                    withAnimation(.snappy) {
                                                        task.isCompleted.toggle()
                                                    }
                                                }
                                        }
                                        else {
                                            Circle()
                                                .fill(.black)
                                                .frame(width: 19, height: 19)
                                                .padding(4)
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
        .overlay(alignment: .topTrailing, content: {
            Button(action: {
                createNewTask.toggle()
            }, label: {
                Image(systemName: "plus")
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
            })
            .padding(.horizontal, 16)
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
