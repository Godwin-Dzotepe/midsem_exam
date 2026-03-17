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

  void _showAddTaskDialog(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController courseCodeController = TextEditingController();
    DateTime? selectedDate = DateTime.now();

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: const Text('Add New Task'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(labelText: 'Task Title'),
                  ),
                  TextField(
                    controller: courseCodeController,
                    decoration: const InputDecoration(labelText: 'Course Code'),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        selectedDate == null
                            ? 'No Date Chosen'
                            : 'Date: ${formatDate(selectedDate!)}',
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () async {
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: selectedDate ?? DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (picked != null && picked != selectedDate) {
                            setStateDialog(() {
                              selectedDate = picked;
                            });
                          }
                        },
                        child: const Text('Choose Date'),
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (titleController.text.isNotEmpty &&
                        courseCodeController.text.isNotEmpty &&
                        selectedDate != null) {
                      setState(() {
                        tasks.add(
                          Task(
                            title: titleController.text,
                            courseCode: courseCodeController.text,
                            dueDate: selectedDate!,
                          ),
                        );
                      });
                      Navigator.of(dialogContext).pop();
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
