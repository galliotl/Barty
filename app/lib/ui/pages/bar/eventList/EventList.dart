import 'package:barty/model/Bar.dart';
import 'package:barty/ui/components/cards/EventCard.dart';
import 'package:barty/viewModel/BarPageViewModel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class BarEventListView extends StatelessWidget {
  BarEventListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<BarPageViewModel>(
      builder: (context, child, model) {
        return FutureBuilder<BarPageDetail>(
          future: model.bar,
          builder: (_, AsyncSnapshot<BarPageDetail> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(
                  child: const CircularProgressIndicator(),
                );
              case ConnectionState.done:
                if (snapshot.hasData && snapshot.data.events.isNotEmpty) {
                  var events = snapshot.data.events;
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
                } else {
                  return Center(child: Text("No events at the moment", style: Theme.of(context).textTheme.body2,));
                }
            }
          },
        );
      },
    );
  }
}
