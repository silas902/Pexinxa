
import 'package:flutter/material.dart';
import 'package:pechincha/controllers/product_description_contact_form_controller.dart';
import 'package:pechincha/models/product.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class ProductDescriptionContactFormWidget extends StatefulWidget {
  final Product product;
  final Function ontap;
   const ProductDescriptionContactFormWidget({super.key, required this.product, required this.ontap});

  @override
  State<ProductDescriptionContactFormWidget> createState() => _ProductDescriptionContactFormWidgetState();
}

class _ProductDescriptionContactFormWidgetState extends State<ProductDescriptionContactFormWidget> {
  late final TextEditingController _controllerClientName;
  late final TextEditingController _controllerTelefone;
  @override
  void initState() {
    super.initState();
    _controllerClientName = TextEditingController();
    _controllerTelefone = TextEditingController();
  }

  @override
  void dispose() {
    if (mounted) {
super.dispose();
    _controllerClientName.dispose();
    _controllerTelefone.dispose();
    }
    
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return Consumer<ProductDescriptionContactFormController>(
      builder: (context, contactFormController, child) {
        return Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 20),
          child: Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            width: deviceInfo.size.width * 0.9,
            child: Form(
              key: contactFormController.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('Para Continuar é necessário preencher o formulário'),
                  TextFormField(
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.name,
                    controller: _controllerClientName,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.black,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      labelText: 'Name',
                      labelStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    validator: Validatorless.required('Campo obrigatório'),
                  ),
                  TextFormField(
                    inputFormatters: [
                      contactFormController.maskFormatter
                    ],
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.phone,
                    controller: _controllerTelefone,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.black,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      labelText: 'Telefone',
                      labelStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    validator: Validatorless.multiple([
                      // Validatorless.number('Número invalido'),
                      Validatorless.required('Campo Obrigatório!')
                    ]),
                  ),
                  const Padding(padding: EdgeInsets.all(15)),
                  Center(
                    child: SizedBox(
                      height: 25,
                      width: deviceInfo.size.width * 0.5,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                              (states) => const Color.fromARGB(255, 241, 204, 91),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                // Change your radius here
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                          child: contactFormController.isLoadingForm
                              ? const Center(
                                  child: SizedBox(
                                    height: 10,
                                    width: 15,
                                    child: CircularProgressIndicator(
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              : const Text(
                                  'Enviar',
                                  style: TextStyle(color: Colors.black),
                                ),
                           onPressed: () {
                            bool formValid = contactFormController.formKey.currentState?.validate() ?? false;
                            contactFormController.isLoadingForm? '' :contactFormController.formValid(formValid: formValid, context: context, product: widget.product, clientName: _controllerClientName.text, phoneNumber: _controllerTelefone.text, onTap: widget.ontap);
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
