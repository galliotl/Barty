import 'package:barty/model/BeverageCategory.dart';
import 'package:flutter/material.dart';

class Beverage {

  final BeverageCategory category;
  final String name;
  final String description;

  Beverage({@required this.category, this.description, @required this.name});

}