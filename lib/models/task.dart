class Task {
  Task({
    this.taskId,
    this.title,
    this.description,
    this.date,
    this.category,
    this.isDone = false,
  });
  final int taskId;
  final String title;
  final String description;
  final DateTime date;
  final String category;
  bool isDone;

  void toggleDone() {
    isDone = !isDone;
  }

  Map<String, dynamic> toMap() {
    return {
      //'task_id': taskId,
      'title': title,
      'description': description,
      'task_date': _formatDate(),
      'category': category,
      'is_done': isDone ? 1 : 0,
    };
  }

  String _formatDate() {
    return date.year.toString() +
        '-' +
        date.month.toString() +
        '-' +
        date.day.toString();
  }
}
