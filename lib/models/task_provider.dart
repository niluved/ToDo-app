import 'package:flutter/material.dart';
import 'package:testapp/api/file_manager.dart';
import 'task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> tasks = []; // lista dei task

  // Load tasks from a JSON file
  Future<void> loadListFromFile() async {
    try {
      // legge la lista dal file JSON
      List<dynamic>? jsonList = await FileManager().readJsonFile();
      if (jsonList != null) {
        // importa la lista dal file JSON e aggiorna la variabile 'tasks'
        tasks = jsonList.map((taskJson) => Task.fromJson(taskJson)).toList();
        debugPrint('lista letta dal file JSON');
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error loading list: $e');
    }
  }

  // Add a new task to the list
  Future<void> addTask(Task task) async {
    tasks.add(task); // aggiunge il task alla variabile del Provider
    await FileManager().writeJsonFile(tasks); // salva la lista nel file JSON
    notifyListeners();
  }

  // Update a task in the list
  Future<void> updateTask(int index, Task task) async {
    tasks[index] = task; // aggiorna il task nella variabile del Provider
    await FileManager().writeJsonFile(tasks); // salva la lista nel file JSON
    notifyListeners();
  }

  // Delete a task from the list
  Future<void> deleteTask(int index) async {
    tasks.removeAt(index); // rimuove il task dalla variabile del Provider
    await FileManager().writeJsonFile(tasks); // salva la lista nel file JSON
    notifyListeners();
  }
}
