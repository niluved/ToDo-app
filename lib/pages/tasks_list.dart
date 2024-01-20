import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_model.dart';
import '../models/task_provider.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    // uso il Consumer per utilizzare l'istanza del task provider e accedere alla lista aggiornata di tasks

    return Consumer<TaskProvider>(builder: (context, taskprovider, _) {
      return ListView.builder(
        itemCount: taskprovider.tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(taskprovider.tasks[index].title),
            trailing: Checkbox(
              value: taskprovider.tasks[index].completed,
              onChanged: (value) {
                final updatedTask = Task(
                  title: taskprovider.tasks[index].title,
                  completed: value ?? false,
                );
                // lancio il metodo updateTask per aggiornare il task
                taskprovider.updateTask(index, updatedTask);
              },
            ),
            onLongPress: () {
              // lancio il metodo deleteTask per cancellare il task
              taskprovider.deleteTask(index);
            },
          );
        },
      );
    });
  }
}
