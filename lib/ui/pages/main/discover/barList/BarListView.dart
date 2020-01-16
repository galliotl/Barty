import 'package:barty/model/Bar.dart';
import 'package:barty/ui/components/cards/BarCard.dart';
import 'package:barty/viewModel/DiscoverVM.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class BarListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<DiscoverViewModel>(
      builder: (context, child, model) {
        return FutureBuilder<List<Bar>>(
          future: model.bars,
          builder: (_, AsyncSnapshot<List<Bar>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(
                  child: const CircularProgressIndicator(),
                );
              case ConnectionState.done:
                if (snapshot.hasData) {
                  var bars = snapshot.data;
                  return ListView.separated(
                    itemCount: bars == null ? 0 : bars.length,
                    itemBuilder: (_, int index) {
                      var bar = bars[index];
                      return BarCard(bar: bar);
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
