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
              TextField(
                /* hintText: 'exemplo@email.com',
                  border: InputBorder.none,//OutlineInputBorder(),
                  errorText: 'Campo obrigatório'
                ),
                obscureText: true,
                */
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                ),
                onChanged: onChanged,   // ver qualquer mudança no campo de texto
                onSubmitted: onSubmitted, // bom para desenvolvimento web, quando aperta enter entra o valor no campo
              ),
              ElevatedButton(
                onPressed: login,
                child: Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    String text = emailController.text;
    print(text);
  }

  void onChanged(String text) {
    print(text);
  }

  void onSubmitted(String text) {
    print(text);
  }

}
