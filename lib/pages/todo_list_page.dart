import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

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
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Adicione uma tarefa',
                        hintText: 'Ex. Fazer compras',
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                      onPressed: () {},
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
              SizedBox(height: 16 ,),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Você possui 0 tarefas pendentes',
                    ),
                  ),
                  SizedBox(width: 8,),
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
