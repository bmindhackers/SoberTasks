# SoberTasks
A simple Task Board App


This is a simple task management app built using SwiftUI, implementing the Model-View-ViewModel (MVVM) architecture. It allows users to create boards, add lists to boards, and add tasks to each list. Tasks can be moved between lists and their priority can be updated.

## Features
- **Create Boards**: Users can create multiple boards.
- **Add Lists**: Boards can contain lists, each with a title.
- **Add Tasks**: Users can add tasks to each list. Tasks include a title, description, due date, and priority.
- **Update Task Priority**: Users can change the priority of tasks.
- **Move Tasks Between Lists**: Tasks can be moved between lists on the same board.

## Architecture

The app follows the **MVVM (Model-View-ViewModel)** design pattern:
- **Model**: Represents the data (e.g., `Task`, `List`, `Board`).
- **View**: The UI components are built using SwiftUI views (e.g., `TaskView`, `BoardView`, `ListView`).
- **ViewModel**: The `BoardViewModel` handles the logic of adding tasks, lists, and managing board data.

## Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/bmindhackers/SoberTasks.git
   
2. **Open the project in Xcode**:
    Navigate to the project folder and open the .xcodeproj file.
    
3. **Build and Run**:
Choose a simulator or connect a device, and click on the Run button in Xcode to build and launch the app.
