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
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
    Text(
      'Index 4: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
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
              width: 40,
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
