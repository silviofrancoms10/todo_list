import 'dart:math';

import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget {
  TodoListPage({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Adicione uma tarefa',
                        hintText: 'Ex. Estudar Flutter',
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
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
                      padding: EdgeInsets.all(12),
                    ),
                    child: Icon(
                      Icons.add,
                      size: 30,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    title: Text("Tarefa 1"),
                    subtitle: Text('02/10/2024'),
                    leading: Icon(Icons.save, size: 30,),
                    onTap: () {
                      print('Tarefa 1');
                    },
                  ),
                  ListTile(
                    title: Text("Tarefa 2"),
                    subtitle: Text('03/10/2024'),
                    leading: Icon(Icons.person, size: 30,),
                    onTap: () {
                      print('Tarefa 2');
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Você possui 0 tarefas pendentes",
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {},
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
    );
  }

  void login() {
    print(emailController.text);
    emailController.clear();
  }

  void onChanged(String value) {
    // print(value);
  }

  void onSubmitted(String value) {
    print(value);
  }
}
