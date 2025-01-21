import 'package:shared_preferences/shared_preferences.dart';

class TaskRepository {

  TaskRepository(){
    SharedPreferences.getInstance().then((value) => sharedPreferences = value);
    //como não posso colocar await em um comando no construtor terei que usar o callback 'then'
  }

  late SharedPreferences sharedPreferences;
}