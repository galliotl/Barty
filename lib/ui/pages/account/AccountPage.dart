import 'package:barty/ui/components/navbars/AccountNavbar.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  
  static final routeName = '/account';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AccountNavBar(),
      body: Center(
        child: Text(
          "My account",
          style: Theme.of(context).textTheme.title,
        ),
      ),
    );
  }
}
