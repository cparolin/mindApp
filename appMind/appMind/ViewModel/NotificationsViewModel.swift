//
//  Notifications.swift
//  appMind
//
//  Created by Camila Parolin on 24/10/25.
//

import Foundation
import CoreData
import SwiftUI

@Observable
class NotificationsViewModel {
    public var scheduledNotifications: [ScheduledNotification] = []
    
    public func getNotifications() {
        scheduledNotifications = NotificationsCoreDataModel.shared.fetchScheduledNotifications()
    }
    
    public func createScheduledNotification(id: UUID, date: Date) {
        let newScheduledNotification: ScheduledNotification = NotificationsCoreDataModel.shared.createScheduledNotification(id: id, date: date)
        self.scheduledNotifications.append(newScheduledNotification)
    }
    
    public func deleteScheduledNotification(scheduledNotification: ScheduledNotification) {
        NotificationsCoreDataModel.shared.deleteNotification(scheduledNotification: scheduledNotification)
    }
}
