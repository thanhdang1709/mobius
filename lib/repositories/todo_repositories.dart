import 'package:mobius/db/mock_db.dart';
import 'package:mobius/models/todo_model.dart';
import 'package:mobius/repositories/todo_interface.dart';

class TodoRepository implements ITodokRepository {
  final MockDb _db;

  TodoRepository(this._db);

  @override
  Future<List<TodoModel>> getAll() async {
    var items = await _db.list();
    return items.map((item) => TodoModel.fromMap(item)).toList();
  }

  @override
  Future<TodoModel?> getOne(int id) async {
    var item = await _db.findOne(id);
    return item != null ? TodoModel.fromMap(item) : null;
  }

  @override
  Future<void> insert(TodoModel todo) async {
    await _db.insert(todo.toMap());
  }

  @override
  Future<void> update(TodoModel todo) async {
    await _db.update(todo.toMap());
  }

  @override
  Future<void> delete(String id) async {
    await _db.remove(id);
  }
}
