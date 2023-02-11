// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pechincha/components/category_product_list_widget.dart';
import 'package:pechincha/defaults/colors_gradient_app_bar_home.dart';
import 'package:pechincha/providers/product_by_category_provider.dart';

class CategoryPage extends StatefulWidget {
  final String type;
  const CategoryPage({Key? key, required this.type}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    super.initState();
    context.read<ProductByCategoryProvider>().loadCompany();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
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
                Text(widget.type, style: const TextStyle(fontFamily: 'Montserrat', fontSize: 15, color: Colors.black)),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_upward_sharp,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: CategoryProductListWidget(
                  type: widget.type,
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
