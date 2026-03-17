import 'package:flutter/material.dart';
import '../models/student.dart';
import 'task_list_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  // Dummy student instance for the UI
  final Student student = Student(
    name: 'Godwin Dzotepe',
    studentId: '10987654',
    programme: 'Computer Science',
    level: 300,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                child: Text(
                  student.name.isNotEmpty ? student.name[0] : '?',
                  style: const TextStyle(fontSize: 40),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text('Name: ${student.name}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text('ID: ${student.studentId}', style: const TextStyle(fontSize: 16)),
                      const SizedBox(height: 8),
                      Text('Programme: ${student.programme}', style: const TextStyle(fontSize: 16)),
                      const SizedBox(height: 8),
                      Text('Level: ${student.level}', style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Edit profile functionality goes here
                },
                child: const Text('Edit Profile'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TaskListScreen()),
                  );
                },
                child: const Text('View Tasks'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
