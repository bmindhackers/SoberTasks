//
//  BoardViewModel.swift
//  SoberTasks
//
//  Created by Ch Burhan on 12/5/24.
//

import Foundation

// MARK: - BoardViewModel
/// Handles all the business logic for managing boards, lists, and tasks.
class BoardViewModel: ObservableObject {
    
    @Published var boards: [Board] = [] // All the boards in the app
    
    // MARK: - Board Operations
    
    /// Add a new board.
    func addBoard(name: String) {
        let newBoard = Board(name: name, lists: [])
        boards.append(newBoard)
    }
    
    /// Add a new list to a specific board.
    func addList(to boardID: UUID, title: String) {
        guard let boardIndex = boards.firstIndex(where: { $0.id == boardID }) else { return }
        let newList = List(title: title, tasks: [])
        boards[boardIndex].lists.append(newList)
    }
    
    // MARK: - Task Operations
    
    /// Add a task to a specific list in a board.
    /// - Parameters:
    ///   - listID: The ID of the list to which the task will be added.
    ///   - boardID: The ID of the board where the list resides.
    ///   - task: The task to be added.
    ///   - atTop: Boolean flag to determine if the task should be added at the top (default is false).
    func addTask(to listID: UUID, in boardID: UUID, task: Task, atTop: Bool = false) {
        // Find the board and list
        guard let boardIndex = boards.firstIndex(where: { $0.id == boardID }),
              let listIndex = boards[boardIndex].lists.firstIndex(where: { $0.id == listID }) else { return }
        
        // Add the task at the top or bottom
        if atTop {
            boards[boardIndex].lists[listIndex].tasks.insert(task, at: 0) // Insert at the top
        } else {
            boards[boardIndex].lists[listIndex].tasks.append(task) // Append to the bottom
        }
    }
    
    /// Move a task between lists.
    func moveTask(from sourceListID: UUID, to destinationListID: UUID, in boardID: UUID, taskID: UUID) {
        guard let boardIndex = boards.firstIndex(where: { $0.id == boardID }),
              let sourceListIndex = boards[boardIndex].lists.firstIndex(where: { $0.id == sourceListID }),
              let destinationListIndex = boards[boardIndex].lists.firstIndex(where: { $0.id == destinationListID }),
              let taskIndex = boards[boardIndex].lists[sourceListIndex].tasks.firstIndex(where: { $0.id == taskID }) else { return }
        
        let task = boards[boardIndex].lists[sourceListIndex].tasks.remove(at: taskIndex)
        boards[boardIndex].lists[destinationListIndex].tasks.append(task)
    }
    // MARK: - Task Priority Update
    /// Update the priority of a specific task.
    func updateTaskPriority(boardID: UUID, listID: UUID, taskID: UUID, newPriority: Priority) {
        guard let boardIndex = boards.firstIndex(where: { $0.id == boardID }),
              let listIndex = boards[boardIndex].lists.firstIndex(where: { $0.id == listID }),
              let taskIndex = boards[boardIndex].lists[listIndex].tasks.firstIndex(where: { $0.id == taskID }) else { return }
        
        boards[boardIndex].lists[listIndex].tasks[taskIndex].priority = newPriority
    }
    
}

