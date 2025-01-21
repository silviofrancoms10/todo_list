import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/models/task.dart';

class TaskRepository {

  TaskRepository(){
    SharedPreferences.getInstance().then((value) => sharedPreferences = value);
    //como não posso colocar await em um comando no construtor terei que usar o callback 'then'
  }

  late SharedPreferences sharedPreferences;

  void saveTaskList(List<Task> tasks){
    final jsonString = json.encode(tasks);
    sharedPreferences.setString('task_list', jsonString);
  }
}