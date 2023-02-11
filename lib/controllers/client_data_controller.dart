import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/client_data_provider.dart';

class ClientDataController extends ChangeNotifier{
  Future<String?> sendClientData({required String clientName, required phoneNumber, required BuildContext context}) async {
    String? userId = await context.read<ClientDataProvider>().addClientData(name: clientName, phoneNumber: phoneNumber);
    notifyListeners();
    return userId;
  }
}