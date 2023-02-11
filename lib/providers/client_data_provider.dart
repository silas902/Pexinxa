import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:pechincha/models/client_data.dart';
import 'auth_provider.dart';

class ClientDataProvider extends ChangeNotifier {FirebaseFirestore firestore = FirebaseFirestore.instance;
 AuthProvider authProvider = AuthProvider();
  final String userId;
  final String emailUser;

  ClientDataProvider({ required this.userId, required this.emailUser});
  

  Future loadClientData() async {
    var collection = firestore.collection('users');
    var response = await collection.get();

    for (var doc in response.docs) {
      ClientData(
        nameClente: doc['name'],
        phoneNumber: doc['phoneNumber'],
        email: doc['email'],
      );
    }
    notifyListeners();
  }

  Future<String?> addClientData({required String name, required phoneNumber}) async {
    try {
      //User? user  = authProvider.returnUserId();
      //String? email = context.read<AuthProvider>().emailUser;
      var collection = firestore.collection("users");
      await collection.doc(userId).set(
        {
          'name': name,
          'email': 'email',
          'phoneNumber': phoneNumber
        },
      );
      return userId;
    } on FirebaseException catch (e) {
      return null;
    }
  }
}
