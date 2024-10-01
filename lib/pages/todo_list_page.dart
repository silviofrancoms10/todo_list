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
          child: Row(
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
              ElevatedButton(onPressed: () {}, child: Text("+"))
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