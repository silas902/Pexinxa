import 'package:flutter/material.dart';
import 'package:pechincha/components/login_or_create_account_buttons_widget.dart';
import 'package:pechincha/defaults/colors_screens_authentication.dart';

class AuthenticatioOrCreateAccount extends StatelessWidget {
  const AuthenticatioOrCreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            decoration: BoxDecoration(gradient: gradientAuthrntication),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(height: deviceInfo.size.height * 0.20,),
                Image.asset(
                  "assets/images/marca-horizontal.png",
                  height: deviceInfo.size.height * 0.13,
                ),
                Container(height: deviceInfo.size.height * 0.20,),
                const LoginOrCreateAccountButtonsWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
