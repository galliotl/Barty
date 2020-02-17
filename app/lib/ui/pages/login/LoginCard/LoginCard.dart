import 'package:barty/model/AuthenticationState.dart';
import 'package:barty/providerModel/AuthModel.dart';
import 'package:barty/providerModel/LoginModel.dart';
import 'package:barty/ui/pages/login/LoadingCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LoginCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginModel(),
      // Auth model is used to login when everything is correct
      child: Consumer(
        builder: (context, AuthModel authModel, _) {
          // Login model is used for basic verifications without 
          // having to notify the whole app and reload every components
          return Consumer(
            builder: (context, LoginModel loginModel, _) {
              if (authModel.state == AuthenticationState.Authenticating) {
                return LoadingCard();
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 15, 30, 0),
                    child: TextField(
                      onChanged: (value) { loginModel.phone = value; },
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        labelText: 'Phone',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 15, 30, 60),
                    child: TextField(
                      obscureText: true,
                      onChanged: (value) { loginModel.password = value; },
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: RaisedButton(
                      onPressed: loginModel.isLoginValid()
                          ? () => authModel.login(loginModel.phone, loginModel.password)
                          : null,
                      child: Text(
                        "Login",
                        style: Theme.of(context).textTheme.body1,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
