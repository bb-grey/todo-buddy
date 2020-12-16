import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todobuddy/models/tasks_data.dart';
import '../constants.dart';
import '../models/task.dart';

class CreateTaskScreen extends StatelessWidget {
  static const String routeName = '/create_task';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'New task',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: SafeArea(
        child: TaskForm(),
      ),
    );
  }
}

class TaskForm extends StatefulWidget {
  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String _category;
  DateTime _date;
  FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Flexible(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            children: <Widget>[
              TextField(
                controller: _titleController,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  hintText: 'Title',
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
              ),
              TextField(
                controller: _descriptionController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'What are you Planning?',
                  labelStyle: TextStyle(color: Colors.grey[700]),
                ),
              ),
              SizedBox(height: 15.0),
              Card(
                elevation: 3.0,
                child: ListTile(
                  leading: Icon(
                    Icons.notifications,
                    color: _date == null ? Colors.grey[600] : Color(0xFF5786FF),
                  ),
                  title: Text(
                    _date == null
                        ? 'Select Date'
                        : DateFormat.yMMMd().format(_date),
                    style: TextStyle(
                      color:
                          _date == null ? Colors.grey[600] : Color(0xFF5786FF),
                    ),
                  ),
                  onTap: _pickDate,
                ),
              ),
              Card(
                elevation: 3.0,
                child: ListTile(
                  leading: Icon(
                    FontAwesomeIcons.listAlt,
                    color: _category == null
                        ? Colors.grey[600]
                        : Color(0xFF5786FF),
                  ),
                  title: DropdownButton<String>(
                    hint: Text(
                      _category == null ? 'Select Category' : _category,
                      style: TextStyle(
                        color: _category == null
                            ? Colors.grey[600]
                            : Color(0xFF5786FF),
                      ),
                    ),
                    items: kTaskCategory.map((e) {
                      return DropdownMenuItem<String>(
                        child: Text(e),
                        value: e,
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _category = value;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Color(0xFF5786FF),
          child: FlatButton(
            child: Text(
              'CREATE',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              if (_titleController.text == null ||
                  _descriptionController.text == null ||
                  _category == null ||
                  _date == null) {
                _showErrorMessage();
                return;
              }
              _insertTask();
            },
          ),
        ),
      ],
    );
  }

  void _insertTask() async {
    Task task = Task(
        title: _titleController.text,
        description: _descriptionController.text,
        category: _category,
        date: _date);
    // _titleController.clear();
    // _descriptionController.clear();
    // setState(() {
    //   _date = null;
    //   _category = null;
    // });
    // _focusNode.requestFocus();
    print('before');
    await Provider.of<TasksData>(context, listen: false).getTasks();
    print('get');
    await Provider.of<TasksData>(context, listen: false).addTask(task);
    print('after');
    Navigator.pop(context);
  }

  void _showErrorMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: Text(
            'Warning!',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.red),
          ),
          content: Text('Please fill the task data properly!'),
          actions: <Widget>[
            FlatButton(
              child: Text('Close'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  void _pickDate() async {
    DateTime d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    setState(() {
      _date = d;
    });
  }
}
