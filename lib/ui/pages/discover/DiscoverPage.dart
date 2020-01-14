import 'package:barty/ui/pages/discover/barList/BarListView.dart';
import 'package:barty/ui/pages/discover/eventList/EventListView.dart';
import 'package:flutter/material.dart';

class DiscoverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: Center(
            child: SizedBox(
              width: 230,
              height: 150,
              child: Image.asset("assets/images/image.png"),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            "Bars of the week",
            style: Theme.of(context).textTheme.subtitle,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: BarListView(),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(15, 40, 0, 15),
          child: Text(
            "Events of the week",
            style: Theme.of(context).textTheme.subtitle,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 0, 15),
          child: EventListView(),
        ),
      ],
    );
  }
}
