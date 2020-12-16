import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'task.dart';

class DBHandler {
  Future<Database> _getConnection() async {
    return openDatabase(
      join(await getDatabasesPath(), 'tasks_db.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE task(task_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, ' +
              'title TEXT NOT NULL, description TEXT NULL, task_date DATE NOT NULL, ' +
              'category TEXT NOT NULL, is_done BOOLEAN);',
        );
      },
      version: 1,
    );
  }

  Future<void> insertTask(Task task) async {
    Database db = await _getConnection();
    db.insert('task', task.toMap());

    // List<Task> tasksList = await tasks();
    // for (Task task in tasksList) {
    //   print(task.taskId);
    //   print(task.title);
    //   print(task.description);
    //   print(task.date);
    //   print(task.category);
    //   print(task.isDone);
    //   print('\n');
    // }
  }

  Future<void> deleteTask(Task task) async {
    Database db = await _getConnection();
    db.delete('task', where: 'task_id = ?', whereArgs: [task.taskId]);
  }

  Future<void> updateIsDone(Task task) async {
    Database db = await _getConnection();
    db.update('task', task.toMap(),
        where: 'task_id = ?', whereArgs: [task.taskId]);
  }

  Future<List<Task>> tasks() async {
    Database db = await _getConnection();
    List<Map<String, dynamic>> tasks = await db.query('task');
    return List.generate(tasks.length, (index) {
      return Task(
        taskId: tasks[index]['task_id'],
        title: tasks[index]['title'],
        description: tasks[index]['description'],
        date: _generateDateFromStr(tasks[index]['task_date']),
        category: tasks[index]['category'],
        isDone: tasks[index]['is_done'] == 1 ? true : false,
      );
    });
  }

  DateTime _generateDateFromStr(String strDate) {
    int year = int.parse(strDate.substring(0, strDate.indexOf('-')));
    int month = int.parse(
        strDate.substring(strDate.indexOf('-') + 1, strDate.lastIndexOf('-')));
    int day = int.parse(strDate.substring(strDate.lastIndexOf('-') + 1));
    return DateTime(year, month, day);
  }
}
