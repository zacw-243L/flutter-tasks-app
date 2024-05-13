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
    return const Scaffold(
      backgroundColor: Colors.cyan,
      body: Column(
        children: [],
      ),
    );
  }
}
