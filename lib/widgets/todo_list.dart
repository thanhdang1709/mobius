import 'package:flutter/material.dart';
import 'package:mobius/providers/home_provider.dart';
import 'package:mobius/widgets/todo_item.dart';
import 'package:provider/provider.dart';

class ToDoListWidget extends StatelessWidget {
  const ToDoListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    provider.getAllTodos();
    final todos = provider.toDos;

    return todos.isEmpty
        ? const Center(child: Text('No Todos'))
        : ListView.separated(
            padding: const EdgeInsets.all(20),
            physics: const BouncingScrollPhysics(),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return ToDoWidget(todo: todo);
            },
            separatorBuilder: (context, index) =>
                Container(height: 8, color: Colors.grey[300]));
  }
}
