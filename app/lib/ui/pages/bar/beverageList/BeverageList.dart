import 'package:barty/model/Bar.dart';
import 'package:barty/model/Beverage.dart';
import 'package:barty/ui/components/cards/BeverageCard.dart';
import 'package:barty/viewModel/BarPageViewModel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class BeverageList extends StatelessWidget {
  BeverageList({Key key}) : super(key: key);

  Widget buildDrinksColumn(List<Beverage> list) {
    List<Widget> beverages = [];

    for (Beverage beverage in list) {
      beverages.add(BeverageCard(
        beverage: beverage,
      ));
      beverages.add(SizedBox(
        height: 15,
      ));
    }

    return Column(
      children: beverages,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<BarPageViewModel>(
      builder: (context, child, model) {
        return FutureBuilder<BarPageDetail>(
          future: model.bar,
          builder: (_, AsyncSnapshot<BarPageDetail> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(
                  child: const CircularProgressIndicator(),
                );
              case ConnectionState.done:
                if (snapshot.hasData && snapshot.data.servedBeverages.isNotEmpty) {
                  var beverages = snapshot.data.servedBeverages;
                  return buildDrinksColumn(beverages);
                } else {
                  return Center(child: Text("We currently don't know that...sorry"));
                }
            }
          },
        );
      },
    );
  }
}
