import 'package:barty/model/BeverageCategory.dart';
import 'package:barty/ui/components/alert/NotYetImplementedSnackbar.dart';
import 'package:barty/ui/style/style.dart';
import 'package:flutter/material.dart';

class BeverageCategoryCard extends StatelessWidget {
  final BeverageCategory category;

  BeverageCategoryCard({@required this.category});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Scaffold.of(context)
          .showSnackBar(NotYetImplementedSnackbar(context: context)),
      child: AspectRatio(
        aspectRatio: 1,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  this.category.name,
                  style: Theme.of(context).textTheme.body1,
                ),
                Icon(category.icon),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
