import 'package:barty/ui/components/navbars/AccountNavbar.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AccountNavBar(),
      body: Center(
        child: Text(
          "Account",
          style: Theme.of(context).textTheme.title,
        ),
      ),
    );
  }
}
