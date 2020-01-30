import 'package:barty/model/Beverage.dart';
import 'package:barty/ui/style/style.dart';
import 'package:flutter/material.dart';

class BeverageCard extends StatelessWidget {
  final Beverage beverage;

  BeverageCard({@required this.beverage});
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
      ),
      child: Container(
        height: 60,
        width: 345,
        child: Row(
          children: [
            // Rounded icon image
            DecoratedBox(
              child: Container(
                height: 60,
                width: 60,
                alignment: Alignment.center,
                child: Icon(beverage.category.icon),
              ),
              decoration: BoxDecoration(
                gradient: gradient,
                shape: BoxShape.circle,
              ),
            ),
            // Text
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name
                    Text(
                      beverage.name,
                      style: Theme.of(context).textTheme.subtitle,
                    ),
                    // Description
                    Text(
                      beverage.description,
                      style: Theme.of(context).textTheme.body2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
