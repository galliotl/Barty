import 'package:flutter/material.dart';

class BartyBottomNav extends StatefulWidget {

  final Function(int) onItemSelectedChange;

  BartyBottomNav({Key key, this.onItemSelectedChange}) : super(key: key);

  @override
  _BartyBottomNavState createState() => _BartyBottomNavState(onItemSelectedChange);
}

class _BartyBottomNavState extends State<BartyBottomNav> {
  
  final Function(int) onItemSelectedChange;
  int _selectedIndex = 0;

  _BartyBottomNavState(this.onItemSelectedChange);
  
  void _onItemTapped(int index, BuildContext context) {
    setState(() {
      _selectedIndex = index;
    });
    onItemSelectedChange(index);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          title: Text('Discover'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_bar),
          title: Text('Bars'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_drink),
          title: Text('Drinks'),
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: (int index) => _onItemTapped(index, context),
    );
  
  }
}
