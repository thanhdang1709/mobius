import 'package:flutter/cupertino.dart';
import 'package:mobius/db/mock_db.dart';
import 'package:mobius/models/todo_model.dart';
import 'package:mobius/repositories/todo_repositories.dart';

class HomeProvider extends ChangeNotifier {
  final TodoRepository _todoRepo = TodoRepository(MockDb());

  Future<List<TodoModel>> getAllTodos() async {
    _toDos = await _todoRepo.getAll();
    notifyListeners();
    return _toDos;
  }

  late List<TodoModel> _toDos;

  List<TodoModel> get toDos =>
      _toDos.where((todo) => todo.isDone == false).toList();

  List<TodoModel> get todosCompleted =>
      _toDos.where((todo) => todo.isDone == true).toList();

  void addToDo(TodoModel todo) {
    _toDos.add(todo);
    _todoRepo.insert(todo);
    notifyListeners();
  }

  void removeToDo(TodoModel todo) {
    _toDos.remove(todo);
    _todoRepo.delete(todo.id!);
    notifyListeners();
  }

  bool toggleToDoStatus(TodoModel todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();
    return todo.isDone;
  }

  void updateToDo(TodoModel todo, String title, String description) {
    todo.title = title;
    todo.description = description;
    notifyListeners();
  }
}
