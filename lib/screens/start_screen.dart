import 'package:flutter/material.dart';
import 'home_screen.dart';

class StartScreen extends StatefulWidget {
  static const routeName = '/start_screen';

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/todo_buddy_logo.png',
                  width: 70.0,
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'IndieFlower',
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: 'Todo',
                        style: TextStyle(color: Colors.red),
                      ),
                      TextSpan(
                        text: 'Buddy',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _navigateToHome(BuildContext context) async {
    Future.delayed(Duration(milliseconds: 2200), () {
      Navigator.pushNamed(context, HomeScreen.routeName);
    });
  }
}
