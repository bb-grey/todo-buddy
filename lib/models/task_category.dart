import 'package:flutter/cupertino.dart';

class TaskCategory {
  TaskCategory({this.icon, this.title, this.iconColor, this.totalTasks});
  final IconData icon;
  final String title;
  final Color iconColor;
  final int totalTasks;
}
