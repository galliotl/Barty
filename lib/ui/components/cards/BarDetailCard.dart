import 'package:barty/model/Bar.dart';
import 'package:barty/ui/components/alert/NotYetImplementedSnackbar.dart';
import 'package:barty/ui/style/style.dart';
import 'package:flutter/material.dart';

class BarDetailCard extends StatelessWidget {
  final Bar bar;

  BarDetailCard({@required this.bar});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Scaffold.of(context)
          .showSnackBar(NotYetImplementedSnackbar(context: context)),
      child: Container(
        height: 100,
        child: Card(
          margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5),
              topLeft: Radius.circular(30),
              topRight: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
          ),
          elevation: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Image and text row
              Row(
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
                    child: Text(
                      bar.openingHours,
                      style: Theme.of(context).textTheme.body2,
                    ),
                  ),
                ],
              ),
              // Bottom detail Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 5),
                    child: Text(
                      bar.rating.toString(),
                      style: Theme.of(context).textTheme.body2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 5, 5),
                    child: Text(
                      bar.address,
                      style: Theme.of(context).textTheme.body2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
