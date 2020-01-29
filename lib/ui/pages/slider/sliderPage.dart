import 'package:barty/model/Bar.dart';
import 'package:barty/ui/components/navbars/SimplestAppBar.dart';
import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  static final routeName = '/slider';

  final Bar bar;

  SliderPage({@required this.bar});

  @override
  _SliderPageState createState() => _SliderPageState(bar: bar);
}

class _SliderPageState extends State<SliderPage> with SingleTickerProviderStateMixin {
  // SliderPageViewModel viewModel;
  final Bar bar;

  _SliderPageState({this.bar});

  @override
  void initState() {
    super.initState();
    // viewModel = BarPageViewModel();
    loadData();
  }

  Future loadData() async {
    // await viewModel.fetchBarDetail(bar.bid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimplestAppBar(),
    );
  }
}
