import 'package:flutter/material.dart';

class ErrorSnackbar extends SnackBar {
  final context;
  final errorMsg;

  ErrorSnackbar({Key key, @required this.context, @required this.errorMsg}): super(
    key: key, 
    content: Text(errorMsg),
    action: SnackBarAction(
        label: 'Ok',
        onPressed: () {
          Scaffold.of(context).hideCurrentSnackBar();
        },
      )
    );
}
