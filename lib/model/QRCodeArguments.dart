import 'package:flutter/material.dart';

class QRCodeArguments {
  
  final ImageProvider imageProvider;
  final String data;

  QRCodeArguments({@required this.data, this.imageProvider});

}