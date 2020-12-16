import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'category_grid_item.dart';
import '../models/tasks_data.dart';
import '../models/task_category.dart';

Widget createCategoryItems(BuildContext context) {
  return Consumer<TasksData>(
    builder: (context, taskData, child) {
      taskData.getTasks();
      return SliverGrid.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 10.0,
        children: <Widget>[
          CategoryGridItem(
            taskCategory: TaskCategory(
                icon: FontAwesomeIcons.clipboard,
                iconColor: Colors.blueAccent,
                title: 'All',
                totalTasks: taskData.tasks == null ? 0 : taskData.tasks.length),
          ),
          CategoryGridItem(
            taskCategory: TaskCategory(
              icon: Icons.mail_outline,
              iconColor: Colors.orange,
              title: 'Work',
              totalTasks: taskData.tasks == null
                  ? 0
                  : taskData.tasks
                      .where((element) => element.category == 'Work')
                      .length,
            ),
          ),
          CategoryGridItem(
            taskCategory: TaskCategory(
              icon: FontAwesomeIcons.headphonesAlt,
              iconColor: Colors.purpleAccent,
              title: 'Music',
              totalTasks: taskData.tasks == null
                  ? 0
                  : taskData.tasks
                      .where((element) => element.category == 'Music')
                      .length,
            ),
          ),
          CategoryGridItem(
            taskCategory: TaskCategory(
              icon: FontAwesomeIcons.paperPlane,
              iconColor: Colors.green,
              title: 'Travel',
              totalTasks: taskData.tasks == null
                  ? 0
                  : taskData.tasks
                      .where((element) => element.category == 'Travel')
                      .length,
            ),
          ),
          CategoryGridItem(
            taskCategory: TaskCategory(
              icon: FontAwesomeIcons.book,
              iconColor: Colors.deepPurpleAccent,
              title: 'Study',
              totalTasks: taskData.tasks == null
                  ? 0
                  : taskData.tasks
                      .where((element) => element.category == 'Study')
                      .length,
            ),
          ),
          CategoryGridItem(
            taskCategory: TaskCategory(
              icon: FontAwesomeIcons.home,
              iconColor: Colors.redAccent,
              title: 'Home',
              totalTasks: taskData.tasks == null
                  ? 0
                  : taskData.tasks
                      .where((element) => element.category == 'Home')
                      .length,
            ),
          ),
          CategoryGridItem(
            taskCategory: TaskCategory(
              icon: FontAwesomeIcons.paintBrush,
              iconColor: Colors.amber[900],
              title: 'Art',
              totalTasks: taskData.tasks == null
                  ? 0
                  : taskData.tasks
                      .where((element) => element.category == 'Art')
                      .length,
            ),
          ),
          CategoryGridItem(
            taskCategory: TaskCategory(
              icon: FontAwesomeIcons.shoppingCart,
              iconColor: Colors.teal,
              title: 'Shopping',
              totalTasks: taskData.tasks == null
                  ? 0
                  : taskData.tasks
                      .where((element) => element.category == 'Shopping')
                      .length,
            ),
          ),
          CategoryGridItem(
            taskCategory: TaskCategory(
              icon: FontAwesomeIcons.question,
              iconColor: Colors.indigoAccent,
              title: 'Others',
              totalTasks: taskData.tasks == null
                  ? 0
                  : taskData.tasks
                      .where((element) => element.category == 'Others')
                      .length,
            ),
          ),
          CategoryGridItem(
            taskCategory: TaskCategory(
              icon: FontAwesomeIcons.checkCircle,
              iconColor: Colors.cyan,
              title: 'Completed',
              totalTasks: taskData.tasks == null
                  ? 0
                  : taskData.tasks.where((element) => element.isDone).length,
            ),
          ),
        ],
      );
    },
  );
}
