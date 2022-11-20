import 'package:flutter/material.dart';
import 'package:hrapp/core/constant/edge_insets.dart';
import 'package:hrapp/core/constant/radius.dart';
import 'package:hrapp/product/constant/colors.dart';

class NavBar extends StatefulWidget {
  final Map? navBarItem;
  const NavBar({
    this.navBarItem,
    super.key,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List<MapEntry<dynamic, dynamic>>? navBar;
  @override
  void initState() {
    navBar = widget.navBarItem?.entries.toList();
    super.initState();
  }

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.appBarPadding(),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          borderRadius: ProjectBorders.mediumAll(),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: MyColor.white,
          //FIXME: Colorlar düzenlenecek
          unselectedItemColor: Colors.grey.shade400,
          backgroundColor: const Color.fromARGB(255, 125, 78, 207),
          onTap: tap,
          items: [
            bottomNavBarItems(navBar![0].key, navBar![0].value),
            bottomNavBarItems(navBar![1].key, navBar![1].value),
            bottomNavBarItems(navBar![2].key, navBar![2].value),
          ],
        ),
      ),
    );
  }

  bottomNavBarItems(String name, IconData icon) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: name,
    );
  }

  tap(index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
