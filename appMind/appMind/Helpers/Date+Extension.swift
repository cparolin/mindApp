//
//  Date+Extension.swift
//  TodoPOC
//
//  Created by André Contarelli Lima on 06/10/25.
//

import SwiftUI

/// Extensão de data necessária para o UI
extension Date {
    
    /// Formatação de data customizada
    func format(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "pt_BR")
        
        return formatter.string(from: self)
    }
    
    /// Checando se a data é "hoje"
    var isToday: Bool {
        return Calendar.current.isDateInToday(self)
    }
    
    /// Checando se a data é na mesma hora
    var isSameHour: Bool {
        return Calendar.current.compare(self, to: .init(), toGranularity: .hour) == .orderedSame
    }
    
    /// Checando se a data ja passou a hora
    var isPast: Bool {
        return Calendar.current.compare(self, to: .init(), toGranularity: .hour) == .orderedAscending
    }
    
    /// Fazendo o fetch da semana baseada na data atual
    func fetchWeek(_ date: Date = .init()) -> [WeekDay] {
        let calendar = Calendar.current
        let startOfDate = calendar.startOfDay(for: date)
        
        var week: [WeekDay] = []
        let weekForDate = calendar.dateInterval(of: .weekOfMonth, for: startOfDate)
        guard let startOfWeek = weekForDate?.start else {
            return[]
        }
        
        (0..<7).forEach { index in
            if let weekDay = calendar.date(byAdding: .day, value: index, to: startOfWeek) {
                week.append(.init(date: weekDay))
            }
        }
        return week
    }
    
    ///Criando próxima semana, baseada na ultima data da semana atual
//    func createNextWeek() -> [WeekDay] {
//        let calendar = Calendar.current
//        let startOfLastDate = calendar.startOfDay(for: self)
//        guard let nextDate = calendar.date(byAdding: .day, value: 1, to: startOfLastDate) else {
//            return []
//        }
//        return fetchWeek(nextDate)
//    }
//
//    ///Criando ultima semana (passada), baseada na ultima data da semana atual
//    func createPreviousWeek() -> [WeekDay] {
//        let calendar = Calendar.current
//        let startOfFirstDate = calendar.startOfDay(for: self)
//        guard let previousDate = calendar.date(byAdding: .day, value: -1, to: startOfFirstDate) else {
//            return []
//        }
//        return fetchWeek(previousDate)
//    }
//
    struct WeekDay: Identifiable {
        var id: UUID = .init()
        var date: Date
    }
}
