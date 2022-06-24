import 'package:flutter/material.dart';
import 'package:mobius/models/todo_model.dart';
import 'package:mobius/providers/home_provider.dart';
import 'package:mobius/widgets/todo_form.dart';
import 'package:provider/provider.dart';

class EditToDoPage extends StatefulWidget {
  final TodoModel todo;

  const EditToDoPage({Key? key, required this.todo}) : super(key: key);

  @override
  _EditToDoPageState createState() => _EditToDoPageState();
}

class _EditToDoPageState extends State<EditToDoPage> {
  final _formKey = GlobalKey<FormState>();

  late String title;
  late String description;

  @override
  void initState() {
    super.initState();

    title = widget.todo.title!;
    description = widget.todo.description!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.grey[300],
          title: const Text('Edit ToDo',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.delete,
                  size: 25,
                  color: Colors.black,
                ),
                onPressed: () {
                  final provider =
                      Provider.of<HomeProvider>(context, listen: false);
                  provider.removeToDo(widget.todo);
                  Navigator.pop(context);
                })
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ToDoFormWidget(
              title: title,
              description: description,
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedDescription: (description) =>
                  setState(() => this.description = description),
              onSavedToDo: saveToDo,
            ),
          ),
        ));
  }

  void saveToDo() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<HomeProvider>(context, listen: false);

      provider.updateToDo(widget.todo, title, description);

      Navigator.of(context).pop();
    }
  }
}
