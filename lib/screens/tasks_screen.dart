import 'package:flutter/material.dart';
import '../models/task.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [
    Task(title: 'Assignment 1', module: 'EGE311'),
    Task(title: 'Project Proposal', module: 'EGE312'),
    Task(title: 'eQuiz1', module: 'EGE313'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: SafeArea(
        child: Column(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(Icons.list),
            ),
            const SizedBox(height: 10.0),
            const Text('Tasks Tracker'),
            Text('${tasks.length} Tasks'),
            const SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tasks[index].title),
                    subtitle: Text(tasks[index].module),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
