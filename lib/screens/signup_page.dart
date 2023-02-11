

import 'package:flutter/material.dart';
import 'package:pechincha/components/signup_page_components/signup_page_form_widget.dart';
import 'package:pechincha/defaults/colors_screens_authentication.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/marca-horizontal.png",
                  height: 80,
                ),
                Container(
                  height: deviceInfo.size.height * 0.10,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SignupPageFormWidget(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
