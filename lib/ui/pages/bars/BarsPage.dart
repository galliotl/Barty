import 'package:barty/model/Bar.dart';
import 'package:barty/ui/components/cards/BarCard.dart';
import 'package:flutter/material.dart';

class BarsPage extends StatelessWidget {

  final List<Bar> bars = Bar.generateRandomBars(1);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BarCard(bar: bars[0],)
    );
  }
  
}