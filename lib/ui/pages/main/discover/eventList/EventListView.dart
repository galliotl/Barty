import 'package:barty/model/Event.dart';
import 'package:barty/ui/components/cards/EventCard.dart';
import 'package:barty/viewModel/DiscoverVM.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class EventListView extends StatelessWidget {
  EventListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<DiscoverViewModel>(
      builder: (context, child, model) {
        return FutureBuilder<List<Event>>(
          future: model.events,
          builder: (_, AsyncSnapshot<List<Event>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(
                  child: const CircularProgressIndicator(),
                );
              case ConnectionState.done:
                if (snapshot.hasData) {
                  var events = snapshot.data;
                  return ListView.separated(
                    itemCount: events == null ? 0 : events.length,
                    itemBuilder: (_, int index) {
                      var event = events[index];
                      return EventCard(event: event);
                    },
                    separatorBuilder: (_, __) => SizedBox(
                      width: 15,
                    ),
                    scrollDirection: Axis.horizontal,
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text("error"));
                }
            }
          },
        );
      },
    );
  }
}
