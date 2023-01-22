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
          return todoListController.todos.length > 0
              ? ListView.builder(
                  itemCount: todoListController.todos.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        tileColor: Colors.blue[500],
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        leading: Container(
                          padding: const EdgeInsets.only(right: 12),
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(width: 1, color: Colors.white),
                            ),
                          ),
                          child: CircleAvatar(
                            child: Text(
                              todoListController.todos[index].id.toString(),
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        title: Text(todoListController.todos[index].title),
                        trailing: Checkbox(
                          onChanged: ((value) {}),
                          value: todoListController.todos[index].completed,
                        ),
                      ),
                    );
                  },
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
