import 'package:barty/providerModel/AuthModel.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:barty/ui/style/style.dart';
import 'package:provider/provider.dart';

class AccountNavBar extends StatelessWidget implements PreferredSizeWidget {
  AccountNavBar({Key key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(50);

  _select(BuildContext context, Choice choice, AuthModel model) {
    switch (choice.title) {
      case "Signout":
        {
          model.signout();
          Navigator.of(context).maybePop();
          return;
        }
      default:
        {
          break;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, AuthModel authModel, _) {
      return GradientAppBar(
        gradient: gradient,
        leading: BackButton(),
        actions: [
          PopupMenuButton<Choice>(
            onSelected: (Choice choice) => _select(context, choice, authModel),
            itemBuilder: (BuildContext context) {
              return choices.map((Choice choice) {
                return PopupMenuItem<Choice>(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },
          ),
        ],
      );
    });
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Signout', icon: Icons.exit_to_app),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128.0, color: textStyle.color),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}
