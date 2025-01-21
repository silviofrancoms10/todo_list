import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/repositories/task_repository.dart';
import 'package:todo_list/widgets/task_list_item.dart';

class TaskListPage extends StatefulWidget {
  TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  final TextEditingController taskController = TextEditingController();
  final TaskRepository taskRepository = TaskRepository();

  List<Task> tasks = [];

  Task? deletedTask;
  int? deletedTaskIndex;

  @override
  void initState() {
    super.initState();

    taskRepository.getTaskList().then((value) {
      setState(() {
        tasks = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: taskController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Adicione uma tarefa',
                          hintText: 'Ex. Estudar Flutter',
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Task task = Task(
                            title: taskController.text,
                            dateTime: DateTime.now(),
                          );
                          tasks.add(task);
                          taskController.clear();
                          taskRepository.saveTaskList(tasks);
                        });
                      },
                      /*child: Text(
                        "+",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),*/
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: Color(0xff00d7f3),
                        foregroundColor: Colors.white,
                        iconColor: Colors.white,
                        padding: EdgeInsets.all(12),
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 30,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (Task task in tasks)
                        TaskListItem(
                          task: task,
                          onDelete: onDelete,
                        ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Você possui ${tasks.length} tarefas pendentes",
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      onPressed: showDeleteTasksConfirmationDialog,
                      child: Text("Limpar tudo"),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: Color(0xff00d7f3),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.all(14),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onDelete(Task task) {
    deletedTask = task;
    deletedTaskIndex = tasks.indexOf(task);

    setState(() {
      tasks.remove(task);
    });
    taskRepository.saveTaskList(tasks);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        'Tarefa ${task.title} foi removida com sucesso!',
        style: TextStyle(color: Color(0xff060708)),
      ),
      backgroundColor: Colors.white,
      action: SnackBarAction(
        label: 'Desfazer',
        textColor: Color(0xff00d7f3),
        onPressed: () {
          setState(() {
            tasks.insert(deletedTaskIndex!, deletedTask!);
          });
          taskRepository.saveTaskList(tasks);
        },
      ),
      duration: Duration(seconds: 5),
    ));
  }

  void showDeleteTasksConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Limpar tudo?'),
        content: Text('Você tem certeza que deseja apaar todas as tarefas?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            style: TextButton.styleFrom(foregroundColor: Color(0xff00d7f3)),
            child: Text(
              'Cancelar',
              // style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              deleteAllTasks();
            },
            child: Text(
              'Limpar Tudo',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  void deleteAllTasks() {
    setState(() {
      tasks.clear();
    });
    taskRepository.saveTaskList(tasks);
  }
}
