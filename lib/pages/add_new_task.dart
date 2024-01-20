import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_model.dart';
import '../models/task_provider.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<TaskProvider>(builder: (context, taskprovider, _) {
          return Column(
            children: [
              TextField(
                controller: _controller,
                decoration: const InputDecoration(labelText: 'Task Title'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // aggiunge una nuova task
                  final newTask = Task(title: _controller.text);
                  taskprovider.addTask(newTask);
                  Navigator.pop(context);
                },
                child: const Text('Add Task'),
              ),
            ],
          );
        }),
      ),
    );
  }
}
