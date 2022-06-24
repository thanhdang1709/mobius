import 'package:mobius/models/todo_model.dart';

abstract class ITodokRepository {
  Future<List<TodoModel>> getAll();
  Future<TodoModel?> getOne(int id);
  Future<void> insert(TodoModel todo);
  Future<void> update(TodoModel todo);
  Future<void> delete(String id);
}
