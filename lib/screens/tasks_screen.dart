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
      body: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.list, color: Colors.cyan),
          ),
          Text(
            'Tasks Tracker',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            '${tasks.length} tasks',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
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
    );
  }
}
