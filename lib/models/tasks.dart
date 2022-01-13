class Task {
  final String name;
  bool isDone;

  Task({required this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }

  Task.fromMap(Map map)
      : name = map['name'],
        isDone = map['isDone'];

  Map toMap() {
    return {'name': name, 'isDone': isDone};
  }
}
