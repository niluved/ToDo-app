import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_model.dart';
import '../models/task_provider.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  // metodo per aggiornare il task completed/not completed al tocco del checkbox
  Future<void> flagTask(TaskProvider taskprovider, int index, bool? isFlagged) async {
    // crea un nuovo oggetto task con il 'completed' aggiornato
    final updatedTask = Task(
      title: taskprovider.tasks[index].title,
      completed: isFlagged ?? false,
    );
    // lancio il metodo updateTask per aggiornare il task
    await taskprovider.updateTask(index, updatedTask);
  }

  @override
  Widget build(BuildContext context) {
    // uso il Consumer per utilizzare l'istanza del task provider e accedere alla lista aggiornata di tasks

    return Consumer<TaskProvider>(builder: (context, taskprovider, _) {
      return ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: taskprovider.tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(taskprovider.tasks[index].title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                )),
            trailing: Transform.scale(
              scale: 0.8,
              child: Switch(
                value: taskprovider.tasks[index].completed,
                onChanged: (value) => flagTask(taskprovider, index, value),
              ),
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
