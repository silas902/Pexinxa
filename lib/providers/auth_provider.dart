// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _emailUser;
  String? _token;
  String? _userId;
  User? _user;
  bool isLoading = true;
  

  String? get emailUser {
    return _emailUser;
  }
  //String? get token {
  //  return _token;
  //}

  String? get userId {
    return _userId;
  }

 
  Future createUserEmailSenha({required String email, required String password, required BuildContext context}) async {
    try {
      UserCredential user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (kDebugMode) {
        print('${user.user!.email}');
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? 'Ocorreu um erro desconhecido'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  Future <User?>loginEmailSenha({required email, required String password, required BuildContext context}) async {
    try {
      UserCredential credencial = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = credencial.user;
      _emailUser = credencial.user!.email!;
      _userId = credencial.user!.uid;
      
      notifyListeners();
      return  _user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? 'Ocorreu um erro desconhecido'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
    return null;
 
  }
   User? returnUserId () {
    return  _user;
  }

  void logout() async {
    await _auth.signOut();
  }
}
