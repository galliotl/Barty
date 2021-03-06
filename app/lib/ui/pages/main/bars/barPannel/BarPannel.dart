import 'package:barty/model/Bar.dart';
import 'package:barty/ui/components/cards/BarDetailCard.dart';
import 'package:barty/viewModel/BarsVM.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class BarPannel extends StatelessWidget {
  final Icon icon;

  BarPannel({this.icon});

  Widget buildEmptyColomn() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: icon,
        ),
        Align(
          child: Container(
            child: Padding(
              child: CircularProgressIndicator(),
              padding: EdgeInsets.all(15),
            ),
            height: 70,
            width: 70,
          ),
          alignment: Alignment.topCenter,
        ),
      ],
    );
  }

  Widget buildBarsColumn(List<Bar> bars) {
    List<Widget> widgets = [
      Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: icon,
        ),
      )
    ];

    for (Bar bar in bars) {
      widgets.add(BarDetailCard(
        bar: bar,
      ));
    }

    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: widgets,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<BarsViewModel>(
      builder: (context, child, model) {
        return FutureBuilder<List<Bar>>(
          future: model.bars,
          builder: (_, AsyncSnapshot<List<Bar>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return buildEmptyColomn();
              case ConnectionState.done:
                if (snapshot.hasData) {
                  var bars = snapshot.data;
                  return buildBarsColumn(bars);
                }
            }
            return Center(child: Text("error"));
          },
        );
      },
    );
  }
}
