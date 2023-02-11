import 'package:flutter/material.dart';
import 'package:pechincha/constantes/types_constantes.dart';
import 'package:pechincha/icons/heart_icons.dart';
import 'package:pechincha/models/product.dart';
import 'package:pechincha/providers/product_by_category_provider.dart';
import 'package:provider/provider.dart';

class CategoryProductListWidget extends StatefulWidget {
  final String type;
  const CategoryProductListWidget({super.key, required this.type});

  @override
  State<CategoryProductListWidget> createState() => _CategoryProductListWidgetState();
}

class _CategoryProductListWidgetState extends State<CategoryProductListWidget> {
  List<Product> categoryType({required String type, required ProductByCategoryProvider productByCategory}) {
    if (type == TypesConstante.iphoneStallments) {
      return productByCategory.productsIphonesInstallments;
    } else if (type == TypesConstante.internetHome) {
      return productByCategory.productsInternetForHome;
    } else if (type == TypesConstante.telephony) {
      return productByCategory.productsTelephony;
    } else if (type == TypesConstante.promotions) {
      return productByCategory.productspromotions;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);

    return Consumer<ProductByCategoryProvider>(
      builder: (context, productByCategory, child) {
        return RefreshIndicator(
          onRefresh: () => productByCategory.loadCompany(),
          child: ListView.builder(
            itemCount: categoryType(type: widget.type, productByCategory: productByCategory).length,
            itemBuilder: (context, index) {
              List<Product> products = categoryType(type: widget.type, productByCategory: productByCategory);
              Product product = products[index];
              return Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 10, top: 10),
                child: InkWell(
                  onTap: () {
                    
                  },
                  child: Container(
                    height: 150,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 4.0,
                          offset: Offset(0.0, 1.0),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Container(
                            color: Colors.white,
                            height: 100,
                            width: 100,
                            child: Image.network(
                              product.imagen,
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15, left: 10),
                              child: SizedBox(
                                //color: Colors.grey,
                                width: deviceInfo.size.width * 0.60,
                                height: 40,
                                child: SingleChildScrollView(
                                  child: Text(
                                    product.nameProduct,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 2, left: 10),
                              child: Text(
                                'De R\$ ${product.oldValue}',
                                style: const TextStyle(fontFamily: 'Montserrat', fontSize: 10, color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                'R\$ ${product.currentValue}',
                                style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    HeartIcons.heartOutline,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
