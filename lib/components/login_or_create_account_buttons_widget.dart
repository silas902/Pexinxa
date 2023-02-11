import 'package:flutter/material.dart';
import 'package:pechincha/screens/login_page.dart';
import 'package:pechincha/screens/signup_page.dart';
//import 'package:pechinchou/screens/signup_page.dart';
//import 'package:pechinchou/screens/authenticatio_page.dart';

class LoginOrCreateAccountButtonsWidget extends StatefulWidget {
  const LoginOrCreateAccountButtonsWidget({Key? key}) : super(key: key);

  @override
  State<LoginOrCreateAccountButtonsWidget> createState() =>
      _LoginOrCreateAccountButtonsWidgetState();
}

class _LoginOrCreateAccountButtonsWidgetState
    extends State<LoginOrCreateAccountButtonsWidget> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return Column(
      children: [
        SizedBox(
          height: 25,
          width: deviceInfo.size.width * 0.8,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                (states) => Colors.white,
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  // Change your radius here
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginPage())),
            child: const Text(
              'Entrar',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.all(10)),
        SizedBox(
          height: 25,
          width: deviceInfo.size.width * 0.5,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                (states) => const Color.fromARGB(255, 230, 182, 37),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  // Change your radius here
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            child: const Text(
              'Criar minha conta',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) => const SignupPage())));
            },
          ),
        )
      ],
    );
  }
}
