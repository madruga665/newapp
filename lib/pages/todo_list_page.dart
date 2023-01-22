import 'package:flutter/material.dart';
import 'package:newapp/models/todo_model.dart';
import 'package:newapp/repositories/todo_repository.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final todoRepository = TodoRepository();
  List<TodoModel> todos = [];

  getAllTodos() async {
    todos = await todoRepository.fetchTodos();
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
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            tileColor: Colors.blue[700],
            textColor: Colors.grey[300],
          );
        },
      ),
    );
  }
}
