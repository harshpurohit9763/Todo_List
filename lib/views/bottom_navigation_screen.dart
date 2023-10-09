import 'package:flutter/material.dart';
import 'package:yours_todo/views/add_task.dart';
import 'package:yours_todo/views/completed_task.dart';
import 'package:yours_todo/views/favorite_task.dart';
import 'package:yours_todo/views/my_drawer.dart';
import 'package:yours_todo/views/task_screens.dart';

class BottomNavigationScreen extends StatefulWidget {
  static const id = 'bottom_navigation_screen';

  BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  final List<Map<String, dynamic>> _pageDetails = [
    {"pageName": const PendingTaskScreen(), "title": 'Pending Task'},
    {"pageName": const CompletedTaskScreen(), "title": 'Completed Task'},
    {"pageName": const FavoriteTaskScreen(), "title": 'Favorite Task'},
  ];

  var selected_pageIndex = 0;

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: const AddTaskWidget(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
          title: Text(_pageDetails[selected_pageIndex]["title"]),
          actions: [
            IconButton(
                onPressed: () {
                  _addTask(context);
                },
                icon: const Icon(Icons.add)),
          ]),
      body: _pageDetails[selected_pageIndex]['pageName'],
      floatingActionButton: FloatingActionButton(
        tooltip: "Add A Task",
        onPressed: () {
          _addTask(context);
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selected_pageIndex,
          onTap: (value) {
            setState(() {
              selected_pageIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.list), label: "Pending Task"),
            BottomNavigationBarItem(icon: Icon(Icons.done), label: "Done"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favorite"),
          ]),
    );
  }
}
