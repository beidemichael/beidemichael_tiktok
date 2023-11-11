import 'package:beidemichael_tiktok/models/video.dart';
import 'package:beidemichael_tiktok/screens/1.apps.dart';
import 'package:beidemichael_tiktok/screens/2.qucon.dart';
import 'package:beidemichael_tiktok/screens/3.zaddy.dart';
import 'package:beidemichael_tiktok/screens/4.organize.dart';
import 'package:beidemichael_tiktok/screens/5.profile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> pages = <Widget>[
    AppsPage(),
    QuconPage(),
    ZaddyPage(),
    OrganizePage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFFFDD5E),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/Apps.png',
              width: 20,
              height: 20,
              color: _selectedIndex == 0 ? Color(0xFFFFDD5E) : Colors.white,
            ),
            label: 'Apps',
            backgroundColor: Color(0xFF2E2E2E),
            // backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Container(
              // color: Colors.orange,
              width: 50,
              height: 21,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/Qucon.png',
                      width: 20,
                      height: 20,
                      color: _selectedIndex == 1
                          ? Color(0xFFFFDD5E)
                          : Colors.white,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 19,
                      height: 13,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFFA8989),
                      ),
                      child: Center(
                          child: Text(
                        '25',
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      )),
                    ),
                  )
                ],
              ),
            ),
            label: 'Qucon',
            backgroundColor: Color(0xFF2E2E2E),
            // backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/Zaady.png',
              width: 20,
              height: 20,
              color: _selectedIndex == 2 ? Color(0xFFFFDD5E) : Colors.white,
            ),
            label: 'Zaady',
            backgroundColor: Color(0xFF2E2E2E),
            // backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/Organize.png',
              width: 20,
              height: 20,
              color: _selectedIndex == 3 ? Color(0xFFFFDD5E) : Colors.white,
            ),
            label: 'Organize',
            backgroundColor: Color(0xFF2E2E2E),
            // backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/Profile.png',
              width: 20,
              height: 20,
              color: _selectedIndex == 4 ? Color(0xFFFFDD5E) : Colors.white,
            ),
            label: 'Profile',
            backgroundColor: Color(0xFF2E2E2E),
            // backgroundColor: Colors.pink,
          ),
        ],
      ),
    );
  }
}
