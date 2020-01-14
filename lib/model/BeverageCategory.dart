import 'package:flutter/material.dart';

class BeverageCategory {
  final IconData icon;
  final String name;

  BeverageCategory({@required this.icon, @required this.name});

  static List<BeverageCategory> generateRandomBeverageCategories(int numberOfCategories) {
    List<BeverageCategory> categories = [];
    for (var i = 0; i < numberOfCategories; i++) {
      categories.add(
        BeverageCategory(
          name: "Beverage $i",
          icon: Icons.local_drink,
        ),
      );
    }
    return categories;
  }
}
