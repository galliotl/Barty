import 'package:flutter/material.dart';

class NotYetImplementedSnackbar extends SnackBar {
  final context;

  NotYetImplementedSnackbar({Key key, @required this.context}): super(
    key: key, 
    content: Text('To be implemented soon!'),
    action: SnackBarAction(
        label: 'Ok',
        onPressed: () {
          Scaffold.of(context).hideCurrentSnackBar();
        },
      )
    );
}
