import 'package:barty/ui/components/navbars/SimplestAppBar.dart';
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

    return Scaffold(
      appBar: SimplestAppBar(),
      body: Center(
        child: Text("comming soon...sliders")
      ),
    );
  }
}
