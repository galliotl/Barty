import 'package:barty/providerModel/LoginOrSignupModel.dart';
import 'package:barty/ui/style/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  static final routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: gradient,
        ),
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: ChangeNotifierProvider(
              create: (_) => LoginOrSignupModel(),
              child: Consumer(
                builder: (context, LoginOrSignupModel model, _) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 230,
                        height: 150,
                        child: Image.asset("assets/images/image.png"),
                      ),
                      Card(
                        elevation: 3,
                        margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        child: Container(
                          height: 300,
                          child: model.loginOrSignupCardContent,
                        ),
                      ),
                      MaterialButton(
                        onPressed: model.switchCard,
                        child: Text(
                          model.loginOrSignupTxt,
                          style: Theme.of(context).textTheme.body1,
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
