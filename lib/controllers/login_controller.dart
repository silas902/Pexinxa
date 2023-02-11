import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pechincha/providers/auth_provider.dart';
import 'package:pechincha/screens/home_page.dart';
import 'package:provider/provider.dart';

class LoginController extends ChangeNotifier {
  
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool showPassword = false;
  bool isEmailValid = true;
  bool isPasswordValid = true;
  bool isLoadingLogin = false;
  User? _user;

  void validateEmail({required controllerEmail}) {
    if (controllerEmail.trim().isEmpty || !controllerEmail.contains('@')) {
      isEmailValid = false;
    } else {
      isEmailValid = true;
    }

    notifyListeners();
  }

  void validatePassword({required controllerPassword}) {
    if (controllerPassword.isEmpty || controllerPassword.length < 6) {
      isPasswordValid = false;
    } else {
      isPasswordValid = true;
    }

    notifyListeners();
  }

  void obscurePassword() {
    showPassword ? showPassword = false : showPassword = true;
    notifyListeners();
  }

  Future login ({required BuildContext context, required controllerEmail, required controllerPassword}) async {
    isLoadingLogin = true;
    notifyListeners();
    _user = await context.read<AuthProvider>().loginEmailSenha(email: controllerEmail, password: controllerPassword, context: context);
    
  }

  bool validUser() {
    if (_user != null) {
      return true;
    }

    return false;
  }

  Future<void> formValidate (BuildContext context,{required bool formValid, required controllerEmail, required controllerPassword}) async {
    if (formValid)  {
      await login(context: context, controllerEmail: controllerEmail, controllerPassword: controllerPassword);
      bool isvalisUser = validUser();
      if (isvalisUser) {
        navigate(context);
      }
      isLoadingLogin = false;
      notifyListeners();
    }
  }
  void navigate (BuildContext context){
    isLoadingLogin = true;
    notifyListeners();
    Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()));
  }
}
