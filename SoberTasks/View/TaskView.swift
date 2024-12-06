//
//  TaskView.swift
//  SoberTasks
//
//  Created by Ch Burhan on 12/5/24.
//

import SwiftUI

// MARK: - TaskView
/// Displays an individual task with priority adjustment.
struct TaskView: View {
    @ObservedObject var viewModel: BoardViewModel
    var boardID: UUID
    var listID: UUID
    var task: Task
    
    @State private var selectedPriority: Priority  // Store the selected priority for the task
    
    // Initialize TaskView with the required parameters
    init(viewModel: BoardViewModel, boardID: UUID, listID: UUID, task: Task) {
        self.viewModel = viewModel
        self.boardID = boardID
        self.listID = listID
        self.task = task
        self._selectedPriority = State(initialValue: task.priority)// Set initial priority from task
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Task Title
            Text(task.title)
                .font(.headline)
            
            // Task Priority with Picker
            HStack {
                Text("Priority:").font(.caption).foregroundColor(.gray)
                // Priority Picker or Button
                Picker("Priority", selection: $selectedPriority) {
                    ForEach(Priority.allCases, id: \.self) { priority in
                        Text(priority.rawValue.capitalized)
                            .tag(priority)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .onChange(of: selectedPriority) { newPriority in
                    viewModel.updateTaskPriority(boardID: boardID, listID: listID, taskID: task.id, newPriority: newPriority)
                }
                
            }
            .padding(.top, 4)
        }
        .padding()
        .background(Color.flatBackground(startColor: .green, endColor: .green)
        )
        .cornerRadius(10)
        .shadow(radius: 4)
    }
}

#Preview {
    let sampleTask = Task(title: "Sample Task", description: "This is a sample task", dueDate: Date(), priority: .medium)
    
    TaskView(
        viewModel: BoardViewModel(),
        boardID: UUID(),
        listID: UUID(),
        task: sampleTask
    )
    .previewLayout(.sizeThatFits)
    .padding()
}
