import 'package:flutter/material.dart';
import 'package:newapp/controllers/todo_list_controller.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final todoListController = TodoListController();

  getAllTodos() async {
    await todoListController.getAll();
  }

  @override
  void initState() {
    super.initState();
    getAllTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
      ),
      body: AnimatedBuilder(
        animation: todoListController,
        builder: (context, child) {
          return ListView.builder(
            itemCount: todoListController.todos.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(todoListController.todos[index].title),
                  tileColor: Colors.blue[700],
                  textColor: Colors.grey[300],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
