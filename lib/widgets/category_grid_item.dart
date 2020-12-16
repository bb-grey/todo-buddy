import 'package:flutter/material.dart';
import 'package:todobuddy/screens/tasks_list_screen.dart';
import '../models/task_category.dart';

class CategoryGridItem extends StatelessWidget {
  final TaskCategory taskCategory;
  CategoryGridItem({this.taskCategory});
  // final IconData icon;
  // final Color iconColor;
  // final String title;
  // final int totalTasks;
  // CategoryGridItem({
  //   @required this.icon,
  //   @required this.iconColor,
  //   @required this.title,
  //   @required this.totalTasks,
  // });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 4.0,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Hero(
                tag: taskCategory.title,
                child: Icon(
                  taskCategory.icon,
                  size: 40.0,
                  color: taskCategory.iconColor,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    taskCategory.title,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.fade,
                  ),
                  Text(
                    '${taskCategory.totalTasks} Tasks',
                    style: TextStyle(
                        color: Colors.grey[700], fontFamily: 'Montserrat'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(
          context,
          TasksListScreen.routeName,
          arguments: taskCategory,
        );
      },
    );
  }
}
