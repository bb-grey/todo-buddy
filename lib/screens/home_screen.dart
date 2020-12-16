import 'package:flutter/material.dart';
import 'create_task_screen.dart';
import '../widgets/create_category_items.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () =>
            Navigator.pushNamed(context, CreateTaskScreen.routeName),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 30.0,
                        left: 20,
                        bottom: 20,
                      ),
                      child: Icon(Icons.format_align_left, size: 40.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Lists',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 34.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(10.0),
              sliver: createCategoryItems(context),
            )
          ],
        ),
      ),
    );
  }
}
