import 'task.dart';
import 'db_handler.dart';
import 'package:flutter/foundation.dart';

class TasksData extends ChangeNotifier {
  DBHandler _dbHandler = DBHandler();
  // List<Task> _tasks = [
  //   Task(
  //     taskId: 1,
  //     title: 'Gym',
  //     description: 'Go to gym',
  //     date: DateTime.now(),
  //     category: 'Work',
  //   ),
  //   Task(
  //     taskId: 2,
  //     title: 'buy milk',
  //     description: 'Milk buy krna hai',
  //     date: DateTime.now(),
  //     category: 'Shopping',
  //   ),
  //   Task(
  //     taskId: 3,
  //     title: 'Read Flutter',
  //     description: 'Flutter',
  //     date: DateTime.now(),
  //     category: 'Study',
  //   ),
  //   Task(
  //     taskId: 4,
  //     title: 'Sqlite',
  //     description: 'Study SQLite ..',
  //     date: DateTime.now(),
  //     category: 'Study',
  //   ),
  //   Task(
  //     taskId: 5,
  //     title: 'Clean the room',
  //     description: 'Room cleaning....',
  //     date: DateTime.now(),
  //     category: 'Home',
  //   ),
  //   Task(
  //     taskId: 6,
  //     title: 'Lahore',
  //     description: 'Go to Lahore',
  //     date: DateTime.now(),
  //     category: 'Travel',
  //   ),
  //   Task(
  //     taskId: 7,
  //     title: 'Flutter Project',
  //     description: 'Complete the flutter project',
  //     date: DateTime.now(),
  //     category: 'Work',
  //   ),
  //   Task(
  //     taskId: 8,
  //     title: 'Website',
  //     description: 'Create a website',
  //     date: DateTime.now(),
  //     category: 'Work',
  //   ),
  //   Task(
  //     taskId: 9,
  //     title: 'Run',
  //     description: 'Running...',
  //     date: DateTime.now(),
  //     category: 'Others',
  //   ),
  //   Task(
  //     taskId: 10,
  //     title: 'Painting',
  //     description: 'do some painting...',
  //     date: DateTime.now(),
  //     category: 'Art',
  //   ),
  // ];
  List<Task> tasks;

  Future<List<Task>> getTasks() async {
    tasks = await _dbHandler.tasks();
    notifyListeners();
    return tasks;
  }

  // UnmodifiableListView<Task> get tasks {
  //   return _tasks;
  // }

  Future<void> addTask(Task task) async {
    await _dbHandler.insertTask(task);
    tasks.add(task);
    notifyListeners();
    print('Task Added');
  }

  void toggleDone(Task task) {
    // _tasks
    //     .where((element) => element.taskId == task.taskId)
    //     .toList()[0]
    //     .toggleDone();
    task.toggleDone();
    _dbHandler.updateIsDone(task);
    notifyListeners();
  }

  void deleteTask(Task task) {
    _dbHandler.deleteTask(task);
    notifyListeners();
  }
}
