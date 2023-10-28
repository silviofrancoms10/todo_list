import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
   TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController todoController = TextEditingController();

  List<String> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: todoController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Adicione uma tarefa',
                        hintText: 'Ex. Fazer compras',
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                      onPressed: () {
                        String text = todoController.text;
                        setState(() {
                          todos.add(text);
                        });
                        todoController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffA435F0),
                          padding: EdgeInsets.all(14), // EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusDirectional.horizontal(
                                  start: Radius.circular(8),
                                  end: Radius.circular(8)))
                          //fixedSize: Size(100, 200),
                          ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30,
                      )
                      //Text(
                      // '+',
                      // style: TextStyle(
                      // color: Colors.white,
                      // fontSize: 40
                      // ),
                      // ),
                      )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Flexible( //flexivel para que a lista nao fique cortada, permite scroll na lista
                child: ListView(           //aceita qualquer widget dentro
                  shrinkWrap: true, //deixa a lista o mais enxuta o possivel(espaçamento)
                  children: [
                    for(String todo in todos)
                    ListTile(
                      title: Text(todo),
                      onTap: () => print('tarefa: $todo') ,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Você possui 0 tarefas pendentes',
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffA435F0),
                      padding: EdgeInsets.all(14),
                    ),
                    child: Text('Limpar tudo'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
