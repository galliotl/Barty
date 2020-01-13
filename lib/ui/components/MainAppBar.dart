import 'dart:io';

import 'package:flutter/material.dart';
import 'package:barty/ui/components/alert/NotYetImplementedSnackbar.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:barty/ui/style/style.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {

  MainAppBar({Key key}): super(key: key);
  
  @override
  _MainAppBarState createState() => _MainAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(50);
}

class _MainAppBarState extends State<MainAppBar> with SingleTickerProviderStateMixin {
  
  static final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  
  TextEditingController _searchQuery;
  bool _isSearching = false;
  String searchQuery = "Search query";

  @override
  void initState() {
    super.initState();
    _searchQuery = new TextEditingController();
  }

  void _startSearch() {
    ModalRoute
        .of(context)
        .addLocalHistoryEntry(new LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  Widget _buildSearchField() {
    return new TextField(
      controller: _searchQuery,
      autofocus: true,
      decoration: const InputDecoration(
        hintText: 'Search...',
        border: InputBorder.none,
        hintStyle: const TextStyle(color: lightGrey),
      ),
      style: const TextStyle(color: white, fontSize: 16.0),
      onChanged: updateSearchQuery,
    );
  }

  void updateSearchQuery(String newQuery) {

    setState(() {
      searchQuery = newQuery;
    });

  }
  
  void _stopSearching() {
    _clearSearchQuery();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchQuery() {
    setState(() {
      _searchQuery.clear();
      updateSearchQuery("Search query");
    });
  }

  List<Widget> _buildActions() {

    if (_isSearching) {
      return <Widget>[
        new IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (_searchQuery == null || _searchQuery.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
            _clearSearchQuery();
          },
        ),
      ];
    }

    return <Widget>[
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: _startSearch,
      ),
      IconButton(
        icon: const Icon(Icons.account_circle),
        onPressed: () {
          Scaffold.of(context).showSnackBar(NotYetImplementedSnackbar(context: context));
        },
      )
    ];
  }

  Widget _buildTitle(BuildContext context) {
    var horizontalTitleAlignment = Platform.isIOS ? CrossAxisAlignment.center : CrossAxisAlignment.start;

    return new InkWell(
      onTap: () => scaffoldKey.currentState.openDrawer(),
      child: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: horizontalTitleAlignment,
          children: <Widget>[
            const Text('Barty'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return GradientAppBar(
      gradient: gradient,
      leading: _isSearching ? BackButton() : Icon(Icons.local_bar),
      title: _isSearching ? _buildSearchField() : _buildTitle(context),
      actions: _buildActions(),
    );
  
  }
}
