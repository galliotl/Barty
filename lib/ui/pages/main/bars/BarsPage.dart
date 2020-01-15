import 'package:barty/model/Bar.dart';
import 'package:barty/ui/components/cards/BarDetailCard.dart';
import 'package:flutter/material.dart';

class BarsPage extends StatelessWidget {

  //Todo: delete, just for testing the card
  final Bar bar = Bar.generateRandomBars(1)[0]; 

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BarDetailCard(bar: bar,),
    );
  }
}
