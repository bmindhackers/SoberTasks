//
//  ListView.swift
//  SoberTasks
//
//  Created by Ch Burhan on 12/5/24.
//

import SwiftUI

// MARK: - ListView
/// Displays a list and its tasks.
///
struct ListView: View {
    @ObservedObject var viewModel: BoardViewModel
    var boardID: UUID
    var list: List
    
    @State private var newTaskTitle: String = ""
    
    var body: some View {
        VStack {
            Text(list.title)
                .font(.headline)
                .padding()
            
            // Scrollable area for tasks
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 10) {
                    ForEach(list.tasks) { task in
                        TaskView(
                            viewModel: viewModel,
                            boardID: boardID,
                            listID: list.id,
                            task: task
                        )
                        .padding(.vertical, 4) // Add spacing between tasks
                    }
                }
                .animation(.default, value: list.tasks) // Apply animation to task list
            }
            
            // Add New Task
            TextField("New Task Title", text: $newTaskTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Button("Add Task") {
                guard !newTaskTitle.isEmpty else { return }
                let newTask = Task(title: newTaskTitle, description: "", dueDate: nil, priority: .medium)
                
                // Add the new task at the top of the list with animation
                withAnimation {
                    viewModel.addTask(to: list.id, in: boardID, task: newTask, atTop: true)
                }
                newTaskTitle = ""
            }
            .buttonStyle(.bordered)
            .foregroundColor(.white)
            .background(Color.secondaryAccent)
            .cornerRadius(8)
            .shadow(radius: 3)
        }
        .frame(width: 300)
        .padding()
        .background(Color.flatBackground(startColor: .orange, endColor: .yellow)
        )
        .cornerRadius(8)
        .shadow(radius: 4)
    }
}



#Preview {
    // Sample data for preview
    let viewModel = BoardViewModel() // Initialize your ViewModel
    let sampleList = List(title: "Sample List", tasks: [
        Task(title: "Task 1", description: "Description for task 1", dueDate: Date(), priority: .high),
        Task(title: "Task 2", description: "Description for task 2", dueDate: Date(), priority: .medium)
    ])
    
    ListView(viewModel: viewModel, boardID: UUID(), list: sampleList)
        .previewLayout(.sizeThatFits)
        .padding()
}
