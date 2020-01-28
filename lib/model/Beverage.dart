import 'package:barty/model/BeverageCategory.dart';
import 'package:flutter/material.dart';

class Beverage {
  final BeverageCategory category;
  final String name;
  final String description;

  Beverage({@required this.category, this.description, @required this.name});

  static generateRandomBeverage(int numberOf) {
    List<Beverage> beverages = [];

    for (int i = 0; i < numberOf; i++) {
      beverages.add(
        Beverage(
          category: BeverageCategory(
            icon: Icons.local_bar,
            name: "beer",
          ),
          name: "Ipa",
          description: "this strong taste IPA will help u be your best self",
        ),
      );
    }

    return beverages;
  }
}
