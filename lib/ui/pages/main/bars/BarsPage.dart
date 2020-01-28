import 'package:barty/ui/pages/main/bars/barMap/BarMap.dart';
import 'package:barty/ui/pages/main/bars/barPannel/BarPannel.dart';
import 'package:barty/ui/style/style.dart';
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

  Icon leadingIcon;
  double maxheight = 500;

  @override
  void initState() {
    super.initState();
    viewModel = BarsViewModel();
    leadingIcon = Icon(Icons.arrow_drop_up, color: deepBlue,);
    loadData();
  }

  Future loadData() async {
    await viewModel.fetchBars();

    viewModel.bars.then(
      (onValue) {
        setState(() {
          maxheight = (onValue.length * 75.0 + 15) + 45 + 15;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<BarsViewModel>(
      model: viewModel,
      child: SlidingUpPanel(
        maxHeight: maxheight,
        body: BarMap(),
        panel: BarPannel(
          icon: leadingIcon,
        ),
        onPanelOpened: () {
          setState(() {
            leadingIcon = Icon(
              Icons.arrow_drop_down,
              color: deepBlue,
            );
          });
        },
        onPanelClosed: () {
          setState(() {
            leadingIcon = Icon(
              Icons.arrow_drop_up,
              color: deepBlue,
            );
          });
        },
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
    );
  }
}
