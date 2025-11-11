//
//  NotificationsView.swift
//  appMind
//
//  Created by Camila Parolin on 27/10/25.
//

import SwiftUI

struct NotificationsView: View {
    @State var viewModel = NotificationsViewModel()
    @AppStorage("notification") var notification: Bool = false
    @AppStorage("events") var events: Bool = false
    @AppStorage("reminder") var reminder: Bool = false
    @AppStorage("journal") var journal: Bool = false
    
    @State var reminderTime = Date.now
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section(footer: Text("Use essa opção para ativar ou desativar as notificações do aplicativo.")) {
                        HStack {
                            Image(systemName: "bell.fill")
                                .foregroundStyle(Color.accentColor)
                            Toggle("Notificações", isOn: $notification)
                            
                        }
                    }
                    
                    if notification {
                        
//                        DatePicker("Horário da Noficação:", selection: $reminderTime, displayedComponents: .hourAndMinute)
                        
                        List {
                            Section(header: Text("Tipos de notificações")) {
                                HStack {
                                    Image(systemName: "calendar")
                                        .foregroundStyle(Color.accentColor)
                                    Toggle("Eventos", isOn: $events)
                                }
                                HStack {
                                    Image(systemName: "calendar.day.timeline.left")
                                        .foregroundStyle(Color.accentColor)
                                    Toggle("Lembretes", isOn: $reminder)
                                }
                                HStack {
                                    Image(systemName: "book.pages")
                                        .foregroundStyle(Color.accentColor)
                                    Toggle("Diários", isOn: $journal)
                                }
                            }
                        }
                        
//                        Button {
//                            let notification: NotificationModel = NotificationModel(title: "Hi Camila!", subtitle: "How about starting your daily tasks now?", body: "Guardian is waiting for you to complete them!")
////                            let calendar = Calendar.current
////                            let hour = calendar.component(.hour, from: reminderTime)
////                            let minute = calendar.component(.minute, from: reminderTime)
//                            
//                            NotificationManagerModel.sendNotification(notification: notification)
//                        } label: {
//                            Text("Salvar notificação")
//                        }
//                        
//                        Button {
//                            for scheduledNotification in viewModel.scheduledNotifications {
//                                NotificationManagerModel.cancelScheduledNotification(scheduledNotification: scheduledNotification)
//                                viewModel.deleteScheduledNotification(scheduledNotification: scheduledNotification)
//                            }
//                            viewModel.scheduledNotifications.removeAll()
//                            
//                        } label: {
//                                Text("Disable Notifications")
//                                    .fontWeight(.bold)
//                        }
                    }
                }
            }
            .navigationTitle("Notificações")
            .onAppear {
                viewModel.getNotifications()
            }
        }
    }
}

#Preview {
    NotificationsView()
}
