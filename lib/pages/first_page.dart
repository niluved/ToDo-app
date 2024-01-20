import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_provider.dart';
import 'add_new_task.dart';
import 'tasks_list.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
// metodo che richiama la lettura della lista dal file
  Future<void> readTasksFromfile() async {
    await Provider.of<TaskProvider>(context, listen: false).loadListFromFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo List'),
        elevation: 5,
      ),
      body: FutureBuilder<void>(
          future: readTasksFromfile(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // Check if there is an error
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }
              // altrimenti ritorna la lista
              return const TaskList();
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
