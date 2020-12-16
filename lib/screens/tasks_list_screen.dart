import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todobuddy/models/task_category.dart';
import 'package:todobuddy/models/tasks_data.dart';
import 'create_task_screen.dart';
import '../widgets/task_tile.dart';
import '../models/task.dart';

class TasksListScreen extends StatelessWidget {
  static const String routeName = '/tasks_list';
  @override
  Widget build(BuildContext context) {
    TaskCategory taskCategory = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFF5786FF),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, CreateTaskScreen.routeName);
        },
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 45.0,
                bottom: 15.0,
                top: 15.0,
              ),
              child: _createTasksCategoryDetails(taskCategory),
            ),
            Expanded(
              child: _createTasksList(taskCategory),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createTasksCategoryDetails(TaskCategory taskCategory) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 30.0,
          child: Hero(
            tag: taskCategory.title,
            child: Icon(
              taskCategory.icon,
              size: 30.0,
              color: taskCategory.iconColor,
            ),
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          taskCategory.title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 30.0,
          ),
        ),
        Consumer<TasksData>(
          builder: (context, tasksData, child) {
            int length;
            if (taskCategory.title == 'All') {
              length = tasksData.tasks.toList().length;
            } else if (taskCategory.title == 'Completed') {
              length = tasksData.tasks
                  .where((element) => element.isDone)
                  .toList()
                  .length;
            } else {
              length = tasksData.tasks
                  .where((element) => element.category == taskCategory.title)
                  .toList()
                  .length;
            }
            return Text(
              '$length Tasks',
              style: TextStyle(
                color: Colors.grey[50],
                fontFamily: 'Montserrat',
                fontSize: 16.0,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _createTasksList(TaskCategory taskCategory) {
    return Consumer<TasksData>(
      builder: (context, taskData, child) {
        List<Task> tasks;
        if (taskCategory.title == 'All') {
          tasks = taskData.tasks.toList();
        } else if (taskCategory.title == 'Completed') {
          tasks = taskData.tasks.where((element) => element.isDone).toList();
        } else {
          tasks = taskData.tasks
              .where((element) => element.category == taskCategory.title)
              .toList();
        }
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return TaskTile(tasks[index]);
            },
            itemCount: tasks.length,
          ),
        );
      },
    );
  }
}
