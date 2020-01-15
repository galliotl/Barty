import 'package:barty/model/BeverageCategory.dart';
import 'package:barty/ui/components/cards/BeverageCategoryCard.dart';
import 'package:flutter/material.dart';

class BeverageCategoryGrid extends StatefulWidget {
  BeverageCategoryGrid({Key key}) : super(key: key);

  @override
  _BeverageCategoryGridState createState() => _BeverageCategoryGridState();
}

class _BeverageCategoryGridState extends State<BeverageCategoryGrid> {
  List<BeverageCategoryCard> beverageCategorycards = [];

  @override
  initState() {
    super.initState();
    beverageCategorycards = getBeverageWidgets();
  }

  List<BeverageCategoryCard> getBeverageWidgets() {
    List<BeverageCategoryCard> list = [];
    List<BeverageCategory> beverageCategories =
        BeverageCategory.generateRandomBeverageCategories(9);
    for (BeverageCategory beverageCategory in beverageCategories) {
      list.add(BeverageCategoryCard(
        name: beverageCategory.name,
        icon: beverageCategory.icon,
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(15),
      sliver: SliverGrid(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10
            ),
        delegate: SliverChildListDelegate(beverageCategorycards),
      ),
    );
  }
}
