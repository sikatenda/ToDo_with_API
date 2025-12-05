// This contains the model of my API response

class Todos {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const Todos(
      {required this.userId,
      required this.id,
      required this.title,
      required this.completed});

  factory Todos.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'userId': int userId,
        'id': int id,
        'title': String title,
        'completed': bool completed
      } =>
        Todos(
          userId: userId,
          id: id,
          title: title,
          completed: completed,
        ),
      _ => throw const FormatException('Failed to load todos.'),
    };
  }
}




/*
class Tasks {
  late final int id;
  late final String name;

  Tasks({required this.id, required this.name});

  factory Tasks.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {'id': int id, 'name': String name} => Tasks(
          id: id,
          name: name,
        ),
      _ => throw const FormatException('Failed to load tasks.'),
    };
  }
} */
