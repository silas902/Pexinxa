import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class FormConfirmPassword extends StatelessWidget {
  final TextEditingController controllerConfirmPassword;
  final TextEditingController controllerPassword;

  final bool showPassword;
 
  const FormConfirmPassword({super.key, required this.controllerConfirmPassword,  required this.controllerPassword, required this.showPassword,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0),
      child: TextFormField(
        obscureText: showPassword == false ? true : false,
        controller: controllerConfirmPassword,
        cursorColor: const Color.fromARGB(255, 52, 125, 44),
        keyboardType: TextInputType.visiblePassword,
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
          labelText: 'Confirmar Senha',
          labelStyle: TextStyle(
            fontSize: 14,
            color: Color.fromARGB(255, 52, 125, 44),
          ),
        ),
        validator: Validatorless.multiple([
      Validatorless.compare(controllerPassword, 'Senhas não são iguais'),
      Validatorless.required('Campo Obrigatório!')
    ]),
      ),
    );
  }
}
