import 'package:flutter/material.dart';
import 'package:mobius/models/todo_model.dart';
import 'package:mobius/pages/edit_todo_page.dart';
import 'package:mobius/providers/home_provider.dart';
import 'package:mobius/utils.dart';
import 'package:provider/provider.dart';

class ToDoWidget extends StatelessWidget {
  final TodoModel todo;

  const ToDoWidget({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => editToDo(context, todo),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          color: Colors.white,
          child: Row(
            children: [
              Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                activeColor: Colors.greenAccent,
                checkColor: Colors.black,
                value: todo.isDone,
                onChanged: (_) {
                  final provider =
                      Provider.of<HomeProvider>(context, listen: false);
                  final isDone = provider.toggleToDoStatus(todo);

                  Utils.showSnackBar(
                      context, isDone ? 'Task Done' : 'Task Incomplete');
                },
              ),
              const SizedBox(width: 10),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text("${todo.title}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    if (todo.description!.isNotEmpty)
                      Container(
                        margin: const EdgeInsets.only(top: 7),
                        child: Text("${todo.description}",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            )),
                      )
                  ])),
              IconButton(
                icon: const Icon(Icons.edit, size: 25),
                onPressed: () => editToDo(context, todo),
              ),
              IconButton(
                icon: const Icon(Icons.delete, size: 25),
                onPressed: () => deleteTodo(context, todo),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void deleteTodo(BuildContext context, TodoModel todo) {
    final provider = Provider.of<HomeProvider>(context, listen: false);
    provider.removeToDo(todo);

    Utils.showSnackBar(context, 'Deleted the Task');
  }

  void editToDo(BuildContext context, TodoModel todo) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditToDoPage(todo: todo),
      ),
    );
  }
}
