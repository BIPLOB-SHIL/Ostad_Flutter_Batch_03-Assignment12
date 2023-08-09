import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/cancelled_task_screen.dart';
import 'package:task_manager/ui/screens/completed_task_screen.dart';
import 'package:task_manager/ui/screens/in_progress_task_screen.dart';
import 'package:task_manager/ui/screens/new_task_screen.dart';


import 'add_new_task_screen.dart';

class BottomNavigationBaseScreen extends StatefulWidget {
  const BottomNavigationBaseScreen({super.key});

  @override
  State<BottomNavigationBaseScreen> createState() => _BottomNavigationBaseScreenState();
}

class _BottomNavigationBaseScreenState extends State<BottomNavigationBaseScreen> {

  int _selectedScreenIndex =0;
  final List<Widget> _screens = const [
    NewTaskScreen(),
    InProgressTaskScreen(),
    CancelledTaskScreen(),
    CompletedTaskScreen()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreenIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (int index){
          _selectedScreenIndex = index;
          if(mounted){
            setState(() {

            });
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list_alt),label: "New Task"),
          BottomNavigationBarItem(icon: Icon(Icons.access_time_rounded),label: "In Progress"),
          BottomNavigationBarItem(icon: Icon(Icons.cancel_outlined),label: "Canceled"),
          BottomNavigationBarItem(icon: Icon(Icons.check_circle_outlined),label: "Completed")
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>  AddNewTaskScreen()));
        },
        child: const Icon(Icons.add),
      ),


    );
  }
}
