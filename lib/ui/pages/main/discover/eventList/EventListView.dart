import 'package:barty/model/Event.dart';
import 'package:barty/ui/components/cards/EventCard.dart';
import 'package:flutter/material.dart';

class EventListView extends StatefulWidget {
  EventListView({Key key}) : super(key: key);

  @override
  _EventListViewState createState() => _EventListViewState();
}

class _EventListViewState extends State<EventListView> {
  List<EventCard> eventcards = [];

  @override
  initState() {
    super.initState();
    eventcards = getEventWidgets();
  }

  _EventListViewState();

  List<EventCard> getEventWidgets() {
    List<EventCard> list = [];
    List<Event> events = Event.generateRandomEvents(3);
    for (Event event in events) {
      list.add(EventCard(
        event: event,
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.separated(
        itemBuilder: (_, index) => eventcards[index],
        separatorBuilder: (_, __) => SizedBox(
          width: 15,
        ),
        itemCount: eventcards.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
