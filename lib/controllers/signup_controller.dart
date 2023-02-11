import 'package:flutter/material.dart';
import 'package:pechincha/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class SignupController extends ChangeNotifier {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerConfirmPassword = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool showPassword = false;
  bool isEmailValid = true;
  bool isPasswordValid = true;
  bool isConfirmPassword = true;
  

  void obiscurePassword() {
    showPassword ? showPassword = false : showPassword = true;
    notifyListeners();
  }

  void signup({required BuildContext context}) {
    context.read<AuthProvider>().createUserEmailSenha(
      email: controllerEmail.text,
      password: controllerPassword.text,
      context: context,
    );
  }

  void formValid({required bool formValid, required BuildContext context}) {
    if (formValid) {
      signup(context: context);
    }
  }
}
