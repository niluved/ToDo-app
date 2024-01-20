import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import '../models/task_model.dart';

class FileManager {
// getter per il path target nella cartella external storage
  Future<String?> get externalDirectory async {
    // path = '/storage/emulated/0/Android/data/com.nick.applab.silentsaver/files/'
    Directory? directory = await getExternalStorageDirectory();
    return directory?.path;
  }

  // getter per il file
  Future<File> get jsonFileExternal async {
    final path = await externalDirectory;
    return File('$path/tasks.json');
  }

  // metodo per scrivere la lista in un file json
  Future<void> writeJsonFile(List<Task> tasksList) async {
    try {
      // converte la lista di oggetti Map in una stringa JSON
      String jsonData = jsonEncode(tasksList);
      // scrive la stringa JSON nel file
      File file = await jsonFileExternal;
      await file.writeAsString(jsonData);
      debugPrint('lista salvata nel file JSON');
    } catch (e) {
      debugPrint('Error saving list: $e');
    }
  }

  // metodo per leggere la lista di oggetti dal file json e ritornare la lista
  Future<List<dynamic>?> readJsonFile() async {
    try {
      File file = await FileManager().jsonFileExternal;
      if (file.existsSync()) {
        String data = await file.readAsString();
        List<dynamic> jsonList = jsonDecode(data);
        return jsonList;
      }
    } catch (e) {
      debugPrint('Error loading list: $e');
    }
    return null;
  }
}
