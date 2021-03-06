import 'package:barty/model/Bar.dart';
import 'package:barty/ui/pages/bar/BarPage.dart';
import 'package:flutter/material.dart';

class BarCard extends StatelessWidget {
  final Bar bar;

  BarCard({@required this.bar});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BarPage(bar: bar),
        ),
      ),
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
                offset: Offset(0, 10.0),
                blurRadius: 10,
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bar.name,
                  style: Theme.of(context).textTheme.body1,
                ),
                Text(
                  bar.type,
                  style: Theme.of(context).textTheme.body1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
