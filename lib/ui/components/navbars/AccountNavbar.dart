import 'package:flutter/material.dart';
import 'package:barty/ui/components/alert/NotYetImplementedSnackbar.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:barty/ui/style/style.dart';

class AccountNavBar extends StatelessWidget implements PreferredSizeWidget {
  AccountNavBar({Key key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(50);

  List<Widget> _buildActions(BuildContext context) {

    return <Widget>[
      IconButton(
        icon: const Icon(Icons.center_focus_weak),
        onPressed: () {
          Scaffold.of(context).showSnackBar(NotYetImplementedSnackbar(context: context));
        },
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GradientAppBar(
      gradient: gradient,
      leading: BackButton(),
      actions: _buildActions(context),
    );
  }
}
