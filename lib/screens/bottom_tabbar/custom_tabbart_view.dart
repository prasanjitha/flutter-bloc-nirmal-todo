import 'package:flutter/material.dart';

import 'package:todo/themes/custom_colors.dart';
import 'package:todo/screens/home_page/home_page_provider.dart';
import 'package:todo/screens/tasks_page/tasks_page_provider.dart';
import 'package:todo/screens/add_todo_page/add_todo_page_provider.dart';

class CustomTabBarVIEW extends StatefulWidget {
  const CustomTabBarVIEW({super.key});

  @override
  State<CustomTabBarVIEW> createState() => _CustomTabBarVIEWState();
}

class _CustomTabBarVIEWState extends State<CustomTabBarVIEW> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomePageProvider(),
    HomePageProvider(),
    TasksPageProvider(),
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
        ),
        child: SizedBox(
          height: 60.0,
          width: 60.0,
          child: FloatingActionButton(
            elevation: 5.0,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddTodoPageProvider(),
                ),
              );
            },
            backgroundColor: Theme.of(context).primaryColor,
            child: const Icon(Icons.add),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 60.0,
        child: BottomNavigationBar(
          backgroundColor: CustomColors.LIGHTPURPLE,
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          selectedItemColor: CustomColors.PRIMARY,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30.0),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Container(),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.task, size: 30.0),
              label: 'Tasks',
            ),
          ],
        ),
      ),
    );
  }
}
