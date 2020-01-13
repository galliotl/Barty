import 'package:barty/model/Bar.dart';
import 'package:barty/ui/components/alert/NotYetImplementedSnackbar.dart';
import 'package:barty/ui/style/style.dart';
import 'package:flutter/material.dart';

class BarCard extends StatelessWidget {
  final Bar bar;

  BarCard({@required this.bar});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Scaffold.of(context)
          .showSnackBar(NotYetImplementedSnackbar(context: context)),
      child: SizedBox(
        width: 150,
        height: 150,
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(bar.imagePath),
            ),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  offset: new Offset(0, 10.0),
                  blurRadius: 10)
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(bar.name),
                Text(bar.type),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
