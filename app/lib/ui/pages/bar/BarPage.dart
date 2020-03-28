import 'package:barty/model/Bar.dart';
import 'package:barty/ui/components/navbars/SimplestAppBar.dart';
import 'package:barty/ui/pages/bar/beverageList/BeverageList.dart';
import 'package:barty/ui/style/style.dart';
import 'package:barty/viewModel/BarPageViewModel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'eventList/EventList.dart';

class BarPage extends StatefulWidget {
  static final routeName = '/bar';

  final Bar bar;

  BarPage({@required this.bar});

  @override
  _BarPageState createState() => _BarPageState(bar: bar);
}

class _BarPageState extends State<BarPage> with SingleTickerProviderStateMixin {
  BarPageViewModel viewModel;
  final Bar bar;

  _BarPageState({this.bar});

  @override
  void initState() {
    super.initState();
    viewModel = BarPageViewModel();
    loadData();
  }

  Future loadData() async {
    await viewModel.fetchBarDetail(bar.bid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimplestAppBar(),
      body: ScopedModel<BarPageViewModel>(
        model: viewModel,
        child: ListView(
          children: [
            // Bar avatar
            Padding(
              child: Align(
                alignment: Alignment.center,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: lightBlack.withOpacity(.16),
                        offset: Offset(0, 10.0),
                      )
                    ]
                  ),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      bar.imagePath,
                    ),
                    radius: 50,
                  ),
                ),
              ),
              padding: EdgeInsets.fromLTRB(0, 30, 0, 40),
            ),

            // Bar name
            Text(
              bar.name,
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.center,
            ),

            // Address and time
            Padding(
              padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
              child: Text(
                bar.openingHours,
                style: Theme.of(context).textTheme.body2,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                bar.address,
                style: Theme.of(context).textTheme.body2,
                textAlign: TextAlign.center,
              ),
            ),

            // Events
            Padding(
              padding: EdgeInsets.fromLTRB(15, 40, 0, 15),
              child: Text(
                "Bar's events",
                style: Theme.of(context).textTheme.subtitle,
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 15),
              child: Container(
                height: 150,
                child: BarEventListView(),
              ),
            ),

            // Served Beverages
            Padding(
              padding: EdgeInsets.fromLTRB(15, 40, 0, 15),
              child: Text(
                "Served drinks",
                style: Theme.of(context).textTheme.subtitle,
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 15),
              child: BeverageList(),
            ),
          ],
        ),
      ),
    );
  }
}
