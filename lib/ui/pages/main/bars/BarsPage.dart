import 'package:barty/ui/pages/main/bars/barMap/BarMap.dart';
import 'package:barty/ui/pages/main/bars/barPannel/BarPannel.dart';
import 'package:barty/viewModel/BarsVM.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class BarsPage extends StatefulWidget {
  @override
  _BarsPageState createState() => _BarsPageState();
}

class _BarsPageState extends State<BarsPage>
    with SingleTickerProviderStateMixin {
  BarsViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = BarsViewModel();
    loadData();
  }

  Future loadData() async {
    await viewModel.fetchBars();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<BarsViewModel>(
      model: viewModel,
      child: SlidingUpPanel(
        body: BarMap(),
        panel: BarPannel(),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
    );
  }
}
