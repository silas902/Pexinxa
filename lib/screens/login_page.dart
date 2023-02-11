import 'package:flutter/material.dart';
import 'package:pechincha/components/login_form_widget.dart';
import 'package:pechincha/defaults/colors_screens_authentication.dart';
//import 'package:pechinchou/defaults/colors_screens_authentication.dart';
//import 'package:pechinchou/components/authentication_form_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(gradient: gradientAuthrntication),
          ),
          SingleChildScrollView(
            reverse: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Container(
                //  height: deviceInfo.size.height * 0.10,
                //),
                Container(
                  padding: EdgeInsets.only(
                      left: 45,
                      right: 45,
                      bottom: deviceInfo.size.height * 0.10),
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/marca-horizontal.png",
                    height: 150,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LoginFormWidget(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
