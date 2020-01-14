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
      child: SizedBox(
        width: 345,
        height: 100,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: lightGrey,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5),
              topLeft: Radius.circular(25),
              topRight: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                offset: new Offset(0, 10.0),
                blurRadius: 10,
              ),
            ],
          ),
          // Content is divided in one column of 2 rows
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Image and text row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Name and image column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name and image row
                      Row(
                        children: [
                          // Image column
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                  bar.imagePath,
                                ),
                                radius: 30,
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            // Text column
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      bar.name,
                                      style:
                                          Theme.of(context).textTheme.subtitle,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      bar.type,
                                      style: Theme.of(context).textTheme.body2,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
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
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                    child: Text(
                      bar.rating.toString(),
                      style: Theme.of(context).textTheme.body2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
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
