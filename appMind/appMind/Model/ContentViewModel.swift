//
//  ContentViewModel.swift
//  appMind
//
//  Created by Camila Parolin on 24/10/25.
//

import Foundation
import CoreData
import PhotosUI

@Observable
class ContentViewModel {
    public var scheduledNotifications: [ScheduledNotification] = []
    
    public func getNotifications() {
        scheduledNotifications = CoreDataController.shared.fetchScheduledNotifications()
    }
    
    public func createScheduledNotification(id: UUID, date: Date) {
        let newScheduledNotification: ScheduledNotification = CoreDataController.shared.createScheduledNotification(id: id, date: date)
        self.scheduledNotifications.append(newScheduledNotification)
    }
    
    public func deleteScheduledNotification(scheduledNotification: ScheduledNotification) {
        CoreDataController.shared.deleteNotification(scheduledNotification: scheduledNotification)
    }
}
