import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;

  const TodoList({
    Key? key,
    required this.taskName,
    required this.taskCompleted,
    this.onChanged,
  }) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 10,
        top: 10,
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Checkbox(
              value: widget.taskCompleted,
              onChanged: widget.onChanged,
              checkColor: Colors.white,
              activeColor: Colors.black,
            ),
            SizedBox(width: 10), // Adjust spacing between checkbox and text
            Flexible(
              child: Text(
                widget.taskName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  decoration: widget.taskCompleted
                      ? TextDecoration.lineThrough
                      : null, // Apply line-through if task is completed
                  decorationColor: Colors.white,
                  decorationThickness: 2,

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
