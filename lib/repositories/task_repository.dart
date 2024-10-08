import 'package:shared_preferences/shared_preferences.dart';

class TaskRepository {

  TaskRepository() {
    SharedPreferences.getInstance().then((value) => sharedPreferences = value); //Async por callback
  }

  late SharedPreferences sharedPreferences;

}
