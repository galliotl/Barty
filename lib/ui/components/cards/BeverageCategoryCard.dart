import 'package:barty/ui/components/alert/NotYetImplementedSnackbar.dart';
import 'package:barty/ui/style/style.dart';
import 'package:flutter/material.dart';

class BeverageCategoryCard extends StatelessWidget {
  final IconData icon;
  final String name;

  BeverageCategoryCard({@required this.name, @required this.icon});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Scaffold.of(context)
          .showSnackBar(NotYetImplementedSnackbar(context: context)),
      child: AspectRatio(
        aspectRatio: 1,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    this.name,
                    style: Theme.of(context).textTheme.body1,
                  ),
                ),
                Align(
                  child: Icon(icon),
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
