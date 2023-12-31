import 'package:ecommerce/routs.dart';
import 'package:ecommerce/screens/profile/profile_screen.dart';
import 'package:ecommerce/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import 'theme.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
     //  home: const SplashScreen(),
    //   home: const HomeScreen(),
    //  initialRoute: HomeScreen.routeName,
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}





