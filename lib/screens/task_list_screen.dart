import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  // Hardcoded list of at least 3 tasks
  final List<Task> tasks = [
    Task(
      title: 'Assignment 1',
      courseCode: 'CS101',
      dueDate: DateTime(2026, 3, 20),
    ),
    Task(
      title: 'Midsem Project',
      courseCode: 'CS202',
      dueDate: DateTime(2026, 3, 25),
    ),
    Task(
      title: 'Lab Report',
      courseCode: 'CS303',
      dueDate: DateTime(2026, 3, 22),
      isComplete: true,
    ),
  ];

  String formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(
            title: Text(task.title),
            subtitle: Text('${task.courseCode} • Due: ${formatDate(task.dueDate)}'),
            trailing: Checkbox(
              value: task.isComplete,
              onChanged: (bool? value) {
                setState(() {
                  task.isComplete = value ?? false;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
