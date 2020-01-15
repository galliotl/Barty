import 'package:barty/model/Bar.dart';
import 'package:barty/ui/components/cards/BarCard.dart';
import 'package:flutter/material.dart';

class BarListView extends StatefulWidget {
  BarListView({Key key}) : super(key: key);

  @override
  _BarListViewState createState() => _BarListViewState();
}

class _BarListViewState extends State<BarListView> {

  List<BarCard> barcards = [];

  @override
  initState() {
    super.initState();
    barcards = getBarWidgets();
  }

  _BarListViewState();

  List<BarCard> getBarWidgets() {
    List<BarCard> list = [];
    List<Bar> bars = Bar.generateRandomBars(3);
    for (Bar bar in bars) {
      list.add(BarCard(
        bar: bar,
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.separated(
        itemBuilder: (_, index) => barcards[index],
        separatorBuilder: (_, __) => SizedBox(
          width: 15,
        ),
        itemCount: barcards.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
