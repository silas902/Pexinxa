import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pechincha/models/company.dart';
import 'package:pechincha/models/product.dart';

class ProductProvider extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;


  final List<Company> companys = [];
  final List<Product> products = []; 


  Future loadCompany() async {
    companys.clear();
    var collection = firestore.collection("empresas");
    var response = await collection.get();

    for (var doc in response.docs) {
      companys.add(
        Company(
          id: doc.id,
          nameCompany: doc['nameEmpresa'],
          cnpj: doc['cnpj'],
        ),
      );
      _loadAllProducts(doc);
    }
  }

  Future _loadAllProducts(doc) async {
    products.clear();
    var collectionproduct = firestore.collection("empresas").doc(doc.id).collection("products");
    var responseProduct = await collectionproduct.get();
    for (var docp in responseProduct.docs) {
      products.add(
        Product(
          idProduct: docp.id,
          idCompany: doc.id,
          nameProduct: docp['name'],
          nameCompany: doc['nameEmpresa'],
          currentValue: docp['currentValue'],
          oldValue: docp['oldValue'],
          description: docp['description'],
          imagen: docp['imagen'],
          type: docp['type'],
        ),
      );
    }
    notifyListeners();
  }

  //Future<Map<String, dynamic>?> loadProducts() async {
  //  products.clear();
  //  var snapsho = firestore.collection("products");
  //  var result = await snapsho.get();
//
  //  for (var doc in result.docs) {
  //    print(doc);
  //    products.add(Product(
  //      id: doc.id,
  //      name: doc["name"],
  //      currentValue: double.tryParse(doc["currentValue"].toString()) ,
  //      oldValue: double.tryParse(doc["oldValue"].toString()),
  //      description: doc["description"],
  //      imagen: doc["imagen"],
  //    ));
  //  }
  //  notifyListeners();
  //}
}
