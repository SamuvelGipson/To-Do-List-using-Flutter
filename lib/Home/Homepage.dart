import 'package:flutter/material.dart';
import 'package:todo/utils/todo_list.dart'; // Ensure this import path is correct and matches your project structure.

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // Define your list of tasks with initial values
  final _controller = TextEditingController();
  List<List<dynamic>> todoList = [
    ['Learn Flutter', false],
    ['Drink coffee', false],
    ['Drank Tea',false]
  ];

  // Function to handle checkbox change
  void checkBoxChanged(int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1]; // Toggle the completed status
    });
  }

  // Function to save a new task
  void saveNewTask() {
    setState(() {
      todoList.add([_controller.text, false]); // Add the task text and set initial status to false
      _controller.clear(); // Clear the text field after adding
    });
  }

  // Function to delete a task
  void deleteTask(int index) {
    setState(() {
      todoList.removeAt(index); // Removes the item at the specified index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: const Text(
          'To Do List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black87,
      ),
      // Create a ListView to display each todo item
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, index) {
          // Use a ListTile to include a delete button
          return ListTile(
            title: TodoList(
              taskName: todoList[index][0], // Display task name
              taskCompleted: todoList[index][1], // Display task completion status
              onChanged: (value) => checkBoxChanged(index), // Handle checkbox changes
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red), // Trash icon
              onPressed: () => deleteTask(index), // Calls deleteTask when pressed
            ),
          );
        },
      ),
      floatingActionButton: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Add more todo items',
                  filled: true,
                  fillColor: Colors.deepPurple.shade200,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.deepPurple,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.deepPurple,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: saveNewTask,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
