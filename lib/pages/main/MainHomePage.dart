import 'package:barty/components/MainAppBar.dart';
import 'package:barty/pages/bars/BarsPage.dart';
import 'package:barty/pages/discover/DiscoverPage.dart';
import 'package:barty/pages/drinks/DrinksPage.dart';
import 'package:flutter/material.dart';
import 'package:barty/components/BartyBottomNav.dart';

class MainHomePage extends StatefulWidget {
  MainHomePage({Key key}) : super(key: key);

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageSelected(int index) {
    _pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: new PageView(
        children: [
          DiscoverPage(),
          BarsPage(),
          DrinksPage(),
        ],
        controller: _pageController,
      ),
      bottomNavigationBar: BartyBottomNav(onItemSelectedChange: onPageSelected,),
    );
  }
}
