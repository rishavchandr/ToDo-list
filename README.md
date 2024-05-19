# To-Do List

To-Do List is a simple iOS application that allows users to manage their tasks. Users can add new tasks, view the list of tasks, and delete tasks. The application uses `UserDefaults` to store and persist the data.

## Features

- **Add Task:** Users can add new tasks to their to-do list.
- **View Tasks:** Users can view a list of all their tasks.
- **Delete Task:** Users can delete tasks from their to-do list.

## Screenshots
## **Display of Task**
<img src="https://github.com/rishavchandr/ToDo-list/assets/110689353/1ebee904-ec58-4aac-a6e1-0a078a11d922" width="200px">


### **Enter Task**
<img src="https://github.com/rishavchandr/ToDo-list/assets/110689353/3ebe48e3-3462-4431-97e9-08d57180f156" width="200px">

### **Delete Task**
<img src="https://github.com/rishavchandr/ToDo-list/assets/110689353/9e951f4e-789d-4424-b000-038d23484323" width="200px">


## Installation

### Prerequisites
- Xcode installed on your macOS
- CocoaPods installed (if needed for dependencies)

### Steps

1. **Clone the repository:**
    ```bash
    git clone https://github.com/rishavchandr/ToDo-list.git
    cd ToDo-list
    ```

2. **Open the project:**
    Open the `.xcworkspace` file in Xcode:
    ```bash
    open ToDoList.xcworkspace
    ```

3. **Build and run the project:**
    Select the target device or simulator in Xcode and press `Command + R` to build and run the app.

## Usage

### Adding a Task
1. Open the app.
2. Navigate to the screen to enter a new task.
3. Type in the task details and save.

### Viewing Tasks
- The main screen displays the list of tasks stored in `UserDefaults`.

### Deleting a Task
1. Swipe left on a task in the list to reveal the delete button.
2. Tap the delete button to remove the task from the list.

## Implementation Details

### Storing Data
- The app uses `UserDefaults` to store tasks. This ensures that tasks persist between app launches.

### Adding a Task
- Tasks are added via a simple form where users can input the task details.

### Deleting a Task
- Tasks can be deleted directly from the list by swiping left and tapping the delete button.

## Contributing
Feel free to submit pull requests or open issues to improve this app. Contributions are always welcome!


