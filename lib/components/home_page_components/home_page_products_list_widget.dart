

import 'package:flutter/material.dart';
import 'package:pechincha/components/home_page_components/home_page_horizontal_ads_widget.dart';
import 'package:pechincha/components/home_page_components/home_page_horizontal_list_widget.dart';
import 'package:pechincha/components/home_page_components/home_page_product_card_widget.dart';
import 'package:pechincha/models/product.dart';
import 'package:pechincha/providers/product_provider.dart';
import 'package:provider/provider.dart';

class HomePageProductsListWidget extends StatefulWidget {
  const HomePageProductsListWidget({super.key});

  @override
  State<HomePageProductsListWidget> createState() => _HomePageProductsListWidgetState();
}

class _HomePageProductsListWidgetState extends State<HomePageProductsListWidget> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).loadCompany();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, providerProduct, child) {
        return RefreshIndicator(
          onRefresh: () => providerProduct.loadCompany(),
          child: ListView.builder(
            itemCount: providerProduct.products.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Column(
                  children: const [
                    HomePageHorizontalListWidget(),
                    HomePageHorizontalAdsWidget(),
                  ],
                );
              } else {
                Product product = providerProduct.products[index - 1];
                return HomePageProductCardWidget(product: product);
              }
            },
          ),
        );
      },
    );
  }
}
