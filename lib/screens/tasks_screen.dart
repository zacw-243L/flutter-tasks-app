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
        child: Padding(
          padding: const EdgeInsets.only(
              top: 40.0, left: 15.0, right: 15.0, bottom: 0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10.0),
                const CircleAvatar(
                  radius: 25.0,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.list,
                    color: Colors.cyan,
                  ),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'Tasks Tracker',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ), // wrap with Container and set color to white
                Text(
                  '${tasks.length} Tasks',
                  style: const TextStyle(
                      fontSize: 16.0, color: Colors.white), // add this line
                ), // wrap with Container and set color to white
                const SizedBox(height: 20.0),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(tasks[index].title),
                          subtitle: Text(tasks[index].module),
                          trailing: Checkbox(
                            value: tasks[index].isDone,
                            onChanged: (value) {},
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
