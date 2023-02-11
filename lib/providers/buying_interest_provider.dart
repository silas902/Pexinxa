import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:pechincha/models/product.dart';

class BuyingInterestProvider extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  

  Future<bool> addProductInterest({required Product product, required userId ,required DateTime dateTime}) async {
    try {
     
      var collection = firestore.collection("users");
      await collection.doc(userId).collection('interests').doc().set(
      {
        'idCompany': product.idCompany,
        'idProduct': product.idProduct,
        'dateTime': dateTime,
        'currentValue': product.currentValue,
        'oldValue': product.oldValue,
        'nameProduct': product.nameProduct,
      },
    );
     return false;
    } on FirebaseException catch (e) {
      
      return false;
      
    }
    
  }
}