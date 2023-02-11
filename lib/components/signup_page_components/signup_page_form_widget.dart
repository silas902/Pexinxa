import 'package:flutter/material.dart';
import 'package:pechincha/components/signup_page_components/signup_page_form_confirm_password_widget.dart';
import 'package:pechincha/components/signup_page_components/signup_page_form_email_widget.dart';
import 'package:pechincha/components/signup_page_components/signup_page_form_password_widget.dart';
import 'package:pechincha/controllers/signup_controller.dart';
import 'package:provider/provider.dart';

class SignupPageFormWidget extends StatefulWidget {
  const SignupPageFormWidget({Key? key}) : super(key: key);

  @override
  State<SignupPageFormWidget> createState() => _SignupPageFormWidgetState();
}

class _SignupPageFormWidgetState extends State<SignupPageFormWidget> {
  @override
  void dispose() {
    super.dispose();
    context.read<SignupController>().controllerEmail.dispose();
    context.read<SignupController>().controllerPassword.dispose();
    context.read<SignupController>().controllerConfirmPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return Consumer<SignupController>(
      builder: (context, signupController, child) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          width: deviceInfo.size.width * 0.9,
          height: 350,
          child: Form(
            key: signupController.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Criar minha conta',
                  style: TextStyle(fontSize: 22, color: Color.fromARGB(255, 52, 125, 44)),
                ),
                FormEmail(controllerEmail: signupController.controllerEmail),
              
                FormPassword(controllerPassword: signupController.controllerPassword, showPassword: signupController.showPassword),

                FormConfirmPassword(controllerConfirmPassword: signupController.controllerConfirmPassword, showPassword: signupController.showPassword, controllerPassword: signupController.controllerPassword),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: SizedBox(
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
                            'Entrar',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            bool formValid = signupController.formKey.currentState?.validate() ?? false;
                                  
                            signupController.formValid(formValid: formValid, context: context);
                          },
                        ),
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
