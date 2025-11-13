// This contains the model of my API response

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
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}
