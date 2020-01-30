import 'package:barty/model/Event.dart';
import 'package:barty/ui/components/alert/NotYetImplementedSnackbar.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final Event event;

  EventCard({@required this.event});

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
              image: NetworkImage(event.imagePath),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      event.title,
                      style: Theme.of(context).textTheme.body1,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      event.barName,
                      style: Theme.of(context).textTheme.body1,
                    ),
                    Text(
                      event.date,
                      style: Theme.of(context).textTheme.body1,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
