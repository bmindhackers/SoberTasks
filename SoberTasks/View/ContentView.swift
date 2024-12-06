//
//  ContentView.swift
//  SoberTasks
//
//  Created by Ch Burhan on 12/5/24.
//

import SwiftUI

import Foundation

struct ContentView: View {
    @ObservedObject var viewModel: BoardViewModel
    @State private var newBoardName: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.flatBackground(startColor: .green, endColor: .yellow)
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 20) {
                    // Boards List
                    ScrollView {
                        ForEach(viewModel.boards) { board in
                            NavigationLink(destination: BoardView(viewModel: viewModel, board: board)) {
                                Text(board.name)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.primaryAccent)
                                    .cornerRadius(12)
                                    .padding(.horizontal)
                                    .shadow(radius: 4)
                            }
                        }
                    }
                    
                    // Add New Board
                    HStack {
                        TextField("New Board Name", text: $newBoardName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                        Button(action: {
                            guard !newBoardName.isEmpty else { return }
                            viewModel.addBoard(name: newBoardName)
                            newBoardName = ""
                        }) {
                            Text("Add Board")
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.secondaryAccent)
                                .cornerRadius(8)
                                .shadow(radius: 3)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical)
            }
            .navigationTitle("SoberTasks")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
