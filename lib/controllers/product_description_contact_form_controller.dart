
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pechincha/controllers/client_data_controller.dart';
import 'package:pechincha/models/product.dart';
import 'package:pechincha/providers/buying_interest_provider.dart';
import 'package:provider/provider.dart';

class ProductDescriptionContactFormController extends ChangeNotifier {
  //ClientDataController clientDataController = ClientDataController();
  BuyingInterestProvider buyingInterestProvider = BuyingInterestProvider();
  DateTime dateTime = DateTime.now();
  final formKey = GlobalKey<FormState>();
  bool isLoadingForm = false;
  

  //void showErrorDialog({required String erroMensagenconten, required String erroMensegeTitle ,required BuildContext context}) {
  //  showDialog(
  //    context: context,
  //    builder: (ctx) => AlertDialog(
  //      title: Text(erroMensegeTitle),
  //      content: Text(erroMensagenconten),
  //      actions: [
  //        TextButton(
  //          onPressed: () => Navigator.of(context).pop(),
  //          child: const Text('Fechar'),
  //        )
  //      ],
  //    ),
  //  );
  //}

  
  var maskFormatter = MaskTextInputFormatter(
      mask: '+# (###) ###-####',
      filter: {
        "#": RegExp(r'[0-9]')
      },
      type: MaskAutoCompletionType.lazy);

  Future formValid({required bool formValid, required BuildContext context, required Product product, required clientName, required phoneNumber, required Function onTap}) async {
    if (formValid) {
      isLoadingForm = true;
      notifyListeners();

      String? userId = await context.read<ClientDataController>().sendClientData(clientName: clientName, phoneNumber: phoneNumber, context: context);
      if (userId != null) {
        Future<bool> isValidProductInteres = buyingInterestProvider.addProductInterest(product: product, dateTime: dateTime, userId: userId);
        isLoadingForm = await isValidProductInteres;
        notifyListeners();
      } else {
        onTap();
        isLoadingForm = false;
        notifyListeners();
      }
      

    }
  }

  //Future<bool> sendClientData({required String clientName, required phoneNumber, required BuildContext context}) async {
  //  userId = await context.read<ClientDataProvider>().addClientData(name: clientName, phoneNumber: phoneNumber, context: context);
  //  notifyListeners();
  //  return true;
  //}
}
