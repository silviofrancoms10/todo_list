import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/models/task.dart';

const taskListKey = 'task_list';
class TaskRepository {
  late SharedPreferences sharedPreferences;

  Future<List<Task>> getTaskList() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final jsonString = sharedPreferences.getString(taskListKey) ?? '[]';
    final List jsonDecoded = json.decode(jsonString) as List;
    return jsonDecoded.map((x) => Task.fromJson(x)).toList();
  }

  void saveTaskList(List<Task> tasks) {
    final jsonString = json.encode(tasks);
    sharedPreferences.setString(taskListKey, jsonString);
  }
}