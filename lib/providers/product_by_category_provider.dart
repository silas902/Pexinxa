import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:pechincha/models/company.dart';
import 'package:pechincha/models/product.dart';

class ProductByCategoryProvider extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final List<Product> products = [];
  final List<Company> companys = [];

  List<Product> productsIphonesInstallments = [];
  List<Product> productsInternetForHome = [];
  List<Product> productsTelephony = [];
  List<Product> productsAdverts = [];
  List<Product> productspromotions = [];

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
    loadProductsCategory();
  }

  Future loadProductsCategory() async {
    productsIphonesInstallments.clear();
    productsInternetForHome.clear();
    productsTelephony.clear();
    productspromotions.clear();
    for (var i = 0; i < products.length; i++) {
      if (products[i].type == "iphonesParcelados") {
        productsIphonesInstallments.add(products[i]);
      } else if (products[i].type == "internetParaCasa") {
        productsInternetForHome.add(products[i]);
      } else if (products[i].type == "telefonia") {
        productsTelephony.add(products[i]);
      } else if (products[i].type == "promoções") {
        productspromotions.add(products[i]);
      } else {
        if (kDebugMode) {
          print('Algum erro na seleção das categorias na pasta providers no produto ${products[i].nameProduct} do tipo invalido ${products[i].type} ');
        }
      }
    }
    notifyListeners();
  }
}
