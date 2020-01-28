import 'package:barty/model/Bar.dart';
import 'package:barty/ui/pages/bar/BarPage.dart';
import 'package:flutter/material.dart';

class BarDetailCard extends StatelessWidget {
  final Bar bar;

  BarDetailCard({@required this.bar});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BarPage(bar: bar),
        ),
      ),
      child: Container(
        height: 75,
        child: Card(
          margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              topLeft: Radius.circular(30),
              topRight: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Image
              CircleAvatar(
                backgroundImage: NetworkImage(
                  bar.imagePath,
                ),
                radius: 30,
              ),
              // Name and type
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        bar.name,
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                      Text(
                        bar.type,
                        style: Theme.of(context).textTheme.body2,
                      ),
                    ],
                  ),
                ),
              ),
              // Opening hours
              Padding(
                padding: EdgeInsets.only(right: 5, top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      bar.openingHours,
                      style: Theme.of(context).textTheme.body2,
                    ),
                    Text(
                      bar.rating.toString(),
                      style: Theme.of(context).textTheme.body2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
