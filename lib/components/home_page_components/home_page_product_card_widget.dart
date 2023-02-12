import 'package:flutter/material.dart';
import 'package:pechincha/icons/heart_icons.dart';
import 'package:pechincha/models/product.dart';
import 'package:pechincha/screens/product_description_page.dart';

class HomePageProductCardWidget extends StatelessWidget {
  final Product product;
  const HomePageProductCardWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 10, top: 10),
      child: InkWell(
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
                    )),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 13, left: 10),
                    child: SizedBox(
                      //color: Colors.grey,
                      width: deviceInfo.size.width * 0.65,
                      height: 38,
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
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDescriptionPage(product: product,)));
        },
      ),
    );
  }
}
