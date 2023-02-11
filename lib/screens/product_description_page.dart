

import 'package:flutter/material.dart';
import 'package:pechincha/components/product_description_components/product_description_details_widget.dart';
import 'package:pechincha/defaults/colors_gradient_app_bar_home.dart';
import 'package:pechincha/models/product.dart';

class ProductDescriptionPage extends StatelessWidget {
  final Product product;
  const ProductDescriptionPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
        children: [
          Container(
            height: 150,
            width: deviceInfo.size.width,
            decoration: BoxDecoration(
              gradient: colorGradientAppBarHome,
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.dehaze_rounded,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                      Image.asset("assets/images/marca-horizontal.png", color: Colors.white, height: 70),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.account_circle_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 9, bottom: 5),
                    child: Text(
                      'O App número 1 dos Brasileiros nos Estados Unidos! ',
                      style: TextStyle(fontFamily: 'Montserrat', fontSize: 10, color: Colors.amber),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.black,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                Text(
                  'Loja: ${product.nameCompany}',
                  style: const TextStyle(
                    fontFamily: 'PTSans-Italic', fontSize: 20,
                    //fontWeight:
                  ),
                ),
                const SizedBox(
                  width: 48.0,
                  height: 48.0,
                ),
              ],
            ),
          ),
          ProductDescriptionDetailsWidget(product: product)
        ],
      ),
    );
  }
}
