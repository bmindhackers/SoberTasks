//
//  Task.swift
//  SoberTasks
//
//  Created by Ch Burhan on 12/5/24.
//

import Foundation

// MARK: - Task Model
/// Represents an individual task in a list.
struct Task: Identifiable, Equatable, Codable {
    let id: UUID = UUID()
    var title: String
    var description: String
    var dueDate: Date?
    var priority: Priority
    
    // Conform to Equatable
    static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.id == rhs.id
    }
}

