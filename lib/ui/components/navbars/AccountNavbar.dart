import 'package:barty/model/QRCodeArguments.dart';
import 'package:barty/ui/pages/account/QRCodePage.dart/QRCodePage.dart';
import 'package:flutter/material.dart';
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
          Navigator.pushNamed(
            context,
            QRCodePage.routeName,
            arguments: QRCodeArguments(
              data: "Here place the user id",
              imageProvider: NetworkImage("http://store.mdcgate.com/market/assets/image/icon_user_default.png")
            ),
          );
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
