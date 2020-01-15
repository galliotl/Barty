import 'package:barty/ui/pages/main/drinks/beverageGrid.dart/BeverageCategoryGrid.dart';
import 'package:flutter/material.dart';

class DrinksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: SizedBox(
              width: 230,
              height: 150,
              child: Image.asset("assets/images/image.png"),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "Today, I crave...",
              style: Theme.of(context).textTheme.subtitle,
            ),
          ),
        ),
        BeverageCategoryGrid(),
      ],
    );
  }
}
