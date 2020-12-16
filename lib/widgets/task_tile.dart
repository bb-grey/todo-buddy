import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todobuddy/models/task.dart';
import 'package:todobuddy/models/tasks_data.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  TaskTile(this.task);
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksData>(
      builder: (context, taskData, child) {
        return ListTile(
          title: Text(
            task.title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(DateFormat.yMMMd().format(task.date)),
          leading: Checkbox(
            value: task.isDone,
            activeColor: Color(0xFF5786FF),
            onChanged: (value) {
              taskData.toggleDone(task);
            },
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () {
              taskData.deleteTask(task);
            },
          ),
        );
      },
    );
  }
}
