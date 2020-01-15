import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:barty/ui/style/style.dart';

class SliderAppBar extends StatelessWidget implements PreferredSizeWidget {
  SliderAppBar({Key key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return GradientAppBar(
      gradient: gradient,
      leading: BackButton(),
    );
  }
}