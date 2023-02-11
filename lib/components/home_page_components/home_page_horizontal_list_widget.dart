import 'package:flutter/material.dart';
import 'package:pechincha/constantes/types_constantes.dart';
import 'package:pechincha/screens/category_page.dart';

class HomePageHorizontalListWidget extends StatelessWidget {
  const HomePageHorizontalListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //color: Colors.amber,

      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 8.0, top: 20, right: 8.0),
            child: Column(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 4.0,
                          offset: Offset(0.0, 1.0),
                        ),
                      ],
                    ),
                    child: Image.network(
                      'https://d2r9epyceweg5n.cloudfront.net/stores/320/515/products/iphone-xr-white-select-2018091-5636a02764540c77f616107458490994-640-0.png',
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CategoryPage(type: TypesConstante.iphoneStallments,)));
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text('Iphones'),
                ),
                const Text('Parcelados')
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 8.0, top: 20, right: 8.0),
            child: Column(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 4.0,
                          offset: Offset(0.0, 1.0),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/pngwing.com.png',
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CategoryPage(type: TypesConstante.internetHome,)));
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text('Internet'),
                ),
                const Text('Para Casa')
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 8.0, top: 20, right: 8.0),
            child: Column(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 4.0,
                          offset: Offset(0.0, 1.0),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/kisspng-mobile-phone-business-mobile-payment-icon-vector-internet-technology-5a9deef7c3d343.7449348215202997678021.png',
                        fit: BoxFit.fill,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CategoryPage(type: TypesConstante.telephony,)));
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text('Telefonia'),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 8.0, top: 20, right: 15),
            child: Column(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 4.0,
                          offset: Offset(0.0, 1.0),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/—Pngtree—portuguese purple lettered label_6950804.png',
                      fit: BoxFit.fitHeight,
                      alignment: Alignment.center,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CategoryPage(type: TypesConstante.promotions,)));
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text('Promoções'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
