//
//  List.swift
//  SoberTasks
//
//  Created by Ch Burhan on 12/5/24.
//

import Foundation

// MARK: - List Model
/// Represents a list of tasks (column in a board).
struct List: Identifiable, Codable {
    let id: UUID
    var title: String
    var tasks: [Task]
    
    init(id: UUID = UUID(), title: String, tasks: [Task] = []) {
        self.id = id
        self.title = title
        self.tasks = tasks
    }
}
