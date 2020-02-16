import 'package:barty/ui/components/navbars/MainAppBar.dart';
import 'package:barty/ui/pages/main/bars/BarsPage.dart';
import 'package:barty/ui/pages/main/discover/DiscoverPage.dart';
import 'package:barty/ui/pages/main/drinks/DrinksPage.dart';
import 'package:flutter/material.dart';
import 'package:barty/ui/components/navbars/BartyBottomNav.dart';

class MainHomePage extends StatefulWidget {
  static final routeName = '/home';
  
  MainHomePage({Key key}) : super(key: key);

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int _selectedPageIndex = 0;

  List<Widget> pages = [
    DiscoverPage(),
    BarsPage(),
    DrinksPage(),
  ];

  void onPageSelected(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: pages[_selectedPageIndex],
      bottomNavigationBar: BartyBottomNav(
        onItemSelectedChange: onPageSelected,
      ),
    );
  }
}
