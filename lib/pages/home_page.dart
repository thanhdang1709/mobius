import 'package:flutter/material.dart';
import 'package:mobius/widgets/todo_add.dart';
import 'package:mobius/widgets/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: const ToDoListWidget(),
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          onPressed: () => showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) => const AddToDoDialogWidget()),
          child: const Icon(Icons.add),
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ));
  }
}
