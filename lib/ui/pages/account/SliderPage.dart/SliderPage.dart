import 'package:barty/model/SliderArguments.dart';
import 'package:barty/ui/components/navbars/SliderAppBar.dart';
import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  
  static final routeName = '/slider';

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  bool validated = false;

  void validate() {
    setState(() {
      validated = true;
    });
  }

  @override
  Widget build(BuildContext context) {

    final SliderArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: SliderAppBar(),
      body: Center(
        child: Text("comming soon...sliders")
      ),
    );
  }
}
