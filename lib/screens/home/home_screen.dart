import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../extend/extend_screen.dart';
import '../manager/manager_screen.dart';
import '../spending/spending_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int pageIndex = 0;

List<Widget> pageList = <Widget>[
  const ManagerScreen(),
  const SpendingScreen(),
  const ExtendScreen(),

  // const MeScreen(),
];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: pageIndex,
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
          selectedIconTheme: const IconThemeData(color: Colors.green),
          selectedItemColor: Colors.green,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          unselectedItemColor: Colors.grey,
          onTap: (value) {
            setState(() {
              pageIndex = value;

              print(value.toString());
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.storefront),
              label: 'Quản lý',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sync_alt),
              label: 'Thu chi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'Thêm',
            ),
          ]),
    );
  }
}
