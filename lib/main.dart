import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_cataloge/core/store.dart';
import 'package:flutter_cataloge/pages/cart_page.dart';
import 'package:flutter_cataloge/pages/main_page.dart';
import 'package:flutter_cataloge/utils/routes.dart';
import 'package:flutter_cataloge/widgets/themes.dart';
import 'package:flutter_cataloge/pages/home_page.dart';
import 'package:flutter_cataloge/pages/login_page.dart';
import 'package:velocity_x/velocity_x.dart';

Future main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        theme: MyTheme.lightTheme(context),
        initialRoute: MyRoutes.homeRoute,
        routes: {
          "/": (context) => LoginPage(),
          // MyRoutes.mainPageRoute: (context) => MainPage(),
          MyRoutes.homeRoute: (context) => HomePage(),
          MyRoutes.loginRoute: (context) => LoginPage(),
          MyRoutes.cartRoute: (context) => CartPage(),
          // },
        });
  }
}
