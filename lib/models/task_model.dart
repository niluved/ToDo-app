class Task {
  String title;
  bool completed;

  Task({required this.title, this.completed = false});

  // Convert JSON-encodable map to Task object
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'],
      completed: json['completed'],
    );
  }

  // Convert Task object to a JSON-encodable map
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'completed': completed,
    };
  }
}
