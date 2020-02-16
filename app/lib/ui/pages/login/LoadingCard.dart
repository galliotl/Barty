import 'package:flutter/material.dart';

class LoadingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      alignment: Alignment.center,
      child:CircularProgressIndicator()
    );
  }
}