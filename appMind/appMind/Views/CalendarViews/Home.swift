//
//  Home.swift
//  TodoPOC
//
//  Created by André Contarelli Lima on 06/10/25.
//
import SwiftData
import SwiftUI

struct Home: View {
    @Query(sort: \Task.todoDateStart) var tasks: [Task]
    @Query(sort: \TaskDay.todoDateDay) var tasksDay: [TaskDay]
    
    @State var currentDate: Date = Date()
    @State private var weekSlider: [[Date.WeekDay]] = []
    @State private var currentWeekIndex: Int = 0
    @State private var createNewTask: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .frame(height: 200)
                    .foregroundColor(.accentColor.opacity(0.3))
                    .vSpacing(.top)
                    .ignoresSafeArea()
                
                VStack(alignment: .center) {
                    Text(Date().format("dd, MMMM YYYY"))
                        .font(.headline)
                        .fontWeight(.semibold)
                        .textScale(.secondary)
                        .foregroundStyle(.black)
                        .padding(.top, 36)
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
                                            .foregroundStyle(.black)
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
                    .vSpacing(.top)
                }
                .padding(.horizontal, 16)
                .hSpacing(.leading)
                Spacer()
            }
            .frame(height: 150)
            
            //Visualização das tarefas
            TasksView(tasksDay: tasksDay, tasks: tasks, currentDate: currentDate)
        })
        .overlay(alignment: .topTrailing, content: {
            Button(action: {
                createNewTask.toggle()
            }, label: {
                Image(systemName: "plus")
                    .fontWeight(.semibold)
                    .foregroundColor(.accentColor)
                    .font(.title2)
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
            NewTaskView(/*newTask: $newTask, newTaskDay: $newTaskDay*/)
                .presentationDetents([.height(585)])
                .presentationCornerRadius(30)
                .background(.white)
        }
    }
}
#Preview {
    ContentView()
}
