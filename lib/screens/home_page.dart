import 'package:flutter/material.dart';
import 'package:pechincha/components/home_page_components/home_page_products_list_widget.dart';
import 'package:pechincha/defaults/colors_gradient_app_bar_home.dart';
import 'package:pechincha/providers/client_data_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    
    super.initState();
    context.read<ClientDataProvider>().loadClientData();
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
                      Image.asset("assets/images/marca-horizontal.png",
                          color: Colors.white, height: 70),
                          
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
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 10,
                          color: Colors.amber),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children:  const [
                Expanded(
                  child: HomePageProductsListWidget()
                  )
                
              ],
            ),
          )
        ],
      ),
    );
  }
}
