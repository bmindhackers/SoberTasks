//
//  BoardView.swift
//  SoberTasks
//
//  Created by Ch Burhan on 12/5/24.
//
import SwiftUI
// MARK: - BoardView
/// Displays the board and its lists.
struct BoardView: View {
    @ObservedObject var viewModel: BoardViewModel
    var board: Board
    
    @State private var newListTitle: String = "" // Holds the title for the new list
    
    var body: some View {
        // Scroll view to allow horizontal scrolling of lists
        ScrollView(.horizontal) {
            HStack(spacing: 16) {
                // Display each list within the board
                ForEach(board.lists) { list in
                    ListView(viewModel: viewModel, boardID: board.id, list: list)
                }
                // Add New List
                VStack {
                    // TextField for entering new list title
                    TextField("New List Title", text: $newListTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    // Button to add the new list
                    Button("Add List") {
                        // Ensure the title is not empty before adding
                        guard !newListTitle.isEmpty else { return }
                        viewModel.addList(to: board.id, title: newListTitle)
                        newListTitle = ""// Clear the input field
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(.white)
                    .background(Color.secondaryAccent)// Custom color for the button
                    .cornerRadius(8)
                    .shadow(radius: 3)
                }
                .frame(width: 200)
                .padding()
                .background(Color.flatBackground(startColor: .orange, endColor: .green)// Custom gradient background
                )
                .cornerRadius(8)
            }
        }
        .padding()
        .background(Color.flatBackground(startColor: .white, endColor: .green))
    }
    
}


#Preview {
    // Sample data for preview
    let viewModel = BoardViewModel() // Initialize your ViewModel
    let sampleBoard = Board(name: "Sample Board", lists: [
        List(title: "List 1", tasks: [
            Task(title: "Task 1", description: "Description for task 1", dueDate: Date(), priority: .high)
        ])
    ])
    
    BoardView(viewModel: viewModel, board: sampleBoard)
        .previewLayout(.sizeThatFits)
        .padding()
}
