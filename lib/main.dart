import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todobuddy/models/tasks_data.dart';
import 'screens/home_screen.dart';
import 'screens/tasks_list_screen.dart';
import 'screens/create_task_screen.dart';
import 'screens/start_screen.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TasksData>(
      create: (context) => TasksData(),
      child: MaterialApp(
        title: 'Todo Buddy',
        initialRoute: StartScreen.routeName,
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          TasksListScreen.routeName: (context) => TasksListScreen(),
          CreateTaskScreen.routeName: (context) => CreateTaskScreen(),
          StartScreen.routeName: (context) => StartScreen(),
        },
      ),
    );
  }
}
