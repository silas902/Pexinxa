import 'package:flutter/material.dart';
import 'package:pechincha/controllers/signup_controller.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class FormPassword extends StatelessWidget {
  final TextEditingController controllerPassword;
  final bool showPassword;
  const FormPassword({super.key, required this.controllerPassword, required this.showPassword});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0),
      child: TextFormField(
        obscureText: showPassword == false ? true : false,
        cursorColor: const Color.fromARGB(255, 52, 125, 44),
        keyboardType: TextInputType.visiblePassword,
        controller: controllerPassword,
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Color.fromARGB(255, 52, 125, 44),
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 52, 125, 44),
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 52, 125, 44),
              width: 2,
            ),
          ),
          labelText: 'Senha',
          labelStyle: const TextStyle(
            fontSize: 14,
            color: Color.fromARGB(255, 52, 125, 44),
          ),
          suffixIcon: GestureDetector(
            child: Icon(
              showPassword == false ? Icons.visibility_off : Icons.visibility,
              color: Colors.black,
            ),
            onTap: () {
              context.read<SignupController>().obiscurePassword();
            },
          ),
        ),
        validator: Validatorless.multiple([
      Validatorless.between(6, 20, 'Senha inválida'),
      Validatorless.required('Campo Obrigatório!')
    ]),
      ),
    );
  }
}
