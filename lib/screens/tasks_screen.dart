import 'package:flutter/material.dart';
import '../screens/addtask_screen.dart';
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
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(1, 15, 1, 0),
                      child: buildTasksList(tasks: tasks),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContextcontext) {
              return AddTaskScreen();
            },
          );
        },
      ),
    );
  }
}

// ignore: camel_case_types
class buildTasksList extends StatefulWidget {
  const buildTasksList({
    super.key,
    required this.tasks,
  });

  final List<Task> tasks;

  @override
  State<buildTasksList> createState() => _buildTasksListState();
}

class _buildTasksListState extends State<buildTasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            widget.tasks[index].title,
            style: TextStyle(
              decoration: widget.tasks[index].isDone
                  ? TextDecoration.lineThrough
                  : null,
            ),
          ),
          subtitle: Text(
            widget.tasks[index].module,
            style: TextStyle(
              decoration: widget.tasks[index].isDone
                  ? TextDecoration.lineThrough
                  : null,
            ),
          ),
          trailing: Checkbox(
            activeColor: Colors.lightBlueAccent,
            value: widget.tasks[index].isDone,
            onChanged: (value) {
              setState(() {
                widget.tasks[index].toggleDone();
              });
            },
          ),
        );
      },
    );
  }
}
