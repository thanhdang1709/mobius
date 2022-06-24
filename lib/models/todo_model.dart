class TodoModel {
  String? id;
  String? title;
  String? description;
  late bool isDone;
  DateTime? createdTime;

  TodoModel(
      {this.id,
      this.title,
      this.description,
      required this.isDone,
      this.createdTime});

  TodoModel.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    isDone = json['is_done'];
    createdTime = json['created_time'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'is_done': isDone,
      'created_time': createdTime,
    };
  }
}
