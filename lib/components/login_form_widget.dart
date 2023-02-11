import 'package:flutter/material.dart';
import 'package:pechincha/controllers/login_controller.dart';
import 'package:pechincha/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({Key? key}) : super(key: key);
  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  late final TextEditingController _controllerEmail;
  late final TextEditingController _controllerPassword;
  // bool _showPassword = false;

  @override
  void initState() {
    super.initState();
    _controllerEmail = TextEditingController();
    _controllerPassword = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return Consumer2<LoginController, AuthProvider>(
      builder: (context, loginController, authProvider, child) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          width: deviceInfo.size.width * 0.9,

          //height: 300, //deviceInfo.size.height *0.35,
          child: Form(
            key: loginController.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Entre com sua conta',
                  style: TextStyle(
                    fontSize: deviceInfo.size.height * 0.03,
                    color: const Color.fromARGB(255, 52, 125, 44),
                  ),
                ),

                //Padding(padding: EdgeInsets.only(top: deviceInfo.size.height * 0.00)),
                TextFormField(
                    cursorColor: const Color.fromARGB(255, 52, 125, 44),
                    keyboardType: TextInputType.emailAddress,
                    controller: _controllerEmail,
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
                    validator: Validatorless.multiple([
                      Validatorless.required('Campo Obrigatório!'),
                      Validatorless.email('E-mail inválido!')
                    ])
                    // (_email) {
                    //  final email = _email ?? '';
                    //  if (email.trim().isEmpty || !email.contains('@')) {
                    //    return 'Imforme um e-mail válido';
                    //  }
                    //  return null;
                    //},
                    ),

                //Padding(padding: EdgeInsets.all(2)),
                TextFormField(
                    obscureText: loginController.showPassword == false ? true : false,
                    cursorColor: const Color.fromARGB(255, 52, 125, 44),
                    keyboardType: TextInputType.visiblePassword,
                    controller: _controllerPassword,
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
                        //alignLabelWithHint: true,
                        //labelStyle: TextStyle(color: Colors.black),
                        suffixIcon: GestureDetector(
                          child: Icon(
                            loginController.showPassword == false ? Icons.visibility_off : Icons.visibility,
                            color: Colors.black,
                          ),
                          onTap: () {
                            loginController.obscurePassword();
                          },
                        )),
                    validator: Validatorless.multiple([
                      Validatorless.between(6, 20, 'Senha inválida'),
                      Validatorless.required('Campo Obrigatório!')
                    ])
                    //validator: (_password) {
                    //  final password = _password ?? '';
                    //  if (password.isEmpty || password.length < 6) {
                    //    return 'Sua senha deve ter no minimo 6 caracteres';
                    //  }
                    //  return null;
                    //},
                    ),

                Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 5),
                  child: SizedBox(
                    height: 25,
                    width: deviceInfo.size.width * 0.5,
                    child: loginController.isLoadingLogin
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: Colors.black,
                          ))
                        : ElevatedButton(
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
                            onPressed: () {
                              loginController.validateEmail(controllerEmail: _controllerEmail.text);
                              loginController.validatePassword(controllerPassword: _controllerPassword.text);

                              bool formValid = loginController.formKey.currentState?.validate() ?? false;

                              loginController.formValidate(context, formValid: formValid, controllerEmail: _controllerEmail.text, controllerPassword: _controllerPassword.text);
                            },
                            child: const Text(
                              'Entrar',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
