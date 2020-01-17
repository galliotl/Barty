import 'package:barty/ui/pages/main/discover/barList/BarListView.dart';
import 'package:barty/ui/pages/main/discover/eventList/EventListView.dart';
import 'package:barty/viewModel/DiscoverVM.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage>
    with SingleTickerProviderStateMixin {
  DiscoverViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = DiscoverViewModel();
    loadData();
  }

  Future loadData() async {
    await viewModel.fetchBars();
    await viewModel.fetchEvents();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<DiscoverViewModel>(
      model: viewModel,
      child: ListView(
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
            child: Container(
              height: 150,
              child: BarListView(),
            ),
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
            child: Container(
              height: 150,
              child: EventListView(),
            ),
          ),
        ],
      ),
    );
  }
}
