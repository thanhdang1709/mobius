import 'package:flutter/material.dart';
import 'package:mobius/models/todo_model.dart';
import 'package:mobius/providers/home_provider.dart';
import 'package:mobius/widgets/todo_form.dart';
import 'package:provider/provider.dart';

class AddToDoDialogWidget extends StatefulWidget {
  const AddToDoDialogWidget({Key? key}) : super(key: key);

  @override
  _AddToDoDialogWidgetState createState() => _AddToDoDialogWidgetState();
}

class _AddToDoDialogWidgetState extends State<AddToDoDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Add ToDo's",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            ToDoFormWidget(
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedDescription: (description) =>
                  setState(() => this.description = description),
              onSavedToDo: addTodo,
            ),
          ],
        ),
      ),
    );
  }

  void addTodo() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final todo = TodoModel(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        createdTime: DateTime.now(),
        isDone: false,
      );
      final provider = Provider.of<HomeProvider>(context, listen: false);
      provider.addToDo(todo);

      Navigator.of(context).pop();
    }
  }
}
