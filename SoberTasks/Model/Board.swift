//
//  Board.swift
//  SoberTasks
//
//  Created by Ch Burhan on 12/5/24.
//

import Foundation

// MARK: - Board Model
/// Represents a collection of lists (board).
struct Board: Identifiable, Codable {
    let id: UUID = UUID()
    var name: String
    var lists: [List]
}
