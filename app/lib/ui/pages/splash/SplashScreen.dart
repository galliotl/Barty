import 'package:barty/ui/style/style.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static final routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: gradient,
      ),
      child: Center(
        child: Container(
          width: 230,
          height: 150,
          child: Image.asset("assets/images/image.png"),
        ),
      ),
    );
  }
}
