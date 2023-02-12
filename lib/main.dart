import 'package:pechincha/controllers/client_data_controller.dart';
import 'package:pechincha/controllers/login_controller.dart';
import 'package:pechincha/controllers/product_description_contact_form_controller.dart';
import 'package:pechincha/controllers/signup_controller.dart';
import 'package:pechincha/providers/auth_provider.dart';
import 'package:pechincha/providers/buying_interest_provider.dart';
import 'package:pechincha/providers/client_data_provider.dart';
import 'package:pechincha/providers/product_by_category_provider.dart';
import 'package:pechincha/providers/product_provider.dart';
import 'package:pechincha/screens/authenticatio_or_create_account.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pechincha/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProxyProvider<AuthProvider, ClientDataProvider>(
          create: (context) => ClientDataProvider(emailUser: '', userId: ''),
          update: (context, authProvider, previous) {
            return ClientDataProvider(emailUser: authProvider.emailUser!, userId: authProvider.userId!);
          },
        ),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => ProductByCategoryProvider()),
        ChangeNotifierProvider(create: (context) => BuyingInterestProvider()),
        ChangeNotifierProvider(create: (context) => LoginController()),
        ChangeNotifierProvider(create: (context) => SignupController()),
        ChangeNotifierProvider(create: (context) => ProductDescriptionContactFormController()),
        ChangeNotifierProvider(create: (context) => ClientDataController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.purple
        ),
          title: 'Pexinxa',
          //theme: ThemeData(
          //    primaryColor: Colors.green[400],
          //    scaffoldBackgroundColor: Colors.green[300],
          //    iconTheme: const IconThemeData(color: Color.fromARGB(255, 92, 194, 99)),
          //    textTheme: const TextTheme(
          //        // Category label
          //        // subtitle1: TextStyle(color: Colors.blue),
          //        //subtitle2:
          //        //    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          //        ),
          //    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(secondary: Colors.yellow[300])),
          home: const AuthenticatioOrCreateAccount() //Splash(),
          ),
    );
  }
}
