// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class FormEmail extends StatelessWidget {
  final TextEditingController controllerEmail;
 
  const FormEmail({Key? key, required this.controllerEmail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: const Color.fromARGB(255, 52, 125, 44),
      keyboardType: TextInputType.emailAddress,
      controller: controllerEmail,
      decoration: const InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Color.fromARGB(255, 52, 125, 44),
          ),
        ),

        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 52, 125, 44),
          ),
        ),

        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 52, 125, 44),
            width: 2,
          ),
        ),
        labelText: 'E-mail',
        labelStyle: TextStyle(
          fontSize: 14,
          color: Color.fromARGB(255, 52, 125, 44),
        ),
        //alignLabelWithHint: true,
        //labelStyle: TextStyle(color: Colors.black),
      ),
      //validator: validateEmail(),
      //validator: (_email) {
      //  final email = _email ?? '';
      //  if (email.trim().isEmpty || !email.contains('@')) {
      //    return 'Imforme um e-mail válido';
      //  }
      //  return null;
      //},
      validator: Validatorless.multiple([
      Validatorless.required('Campo Obrigatório!'),
      Validatorless.email('E-mail inválido!'),
      ]),
    );
  }
}
