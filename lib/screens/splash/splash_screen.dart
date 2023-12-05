
import 'package:ecommerce/screens/splash/components/body.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static String routeName = '/spllash';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  Scaffold(
 resizeToAvoidBottomInset: false,
      body: Body(),
    );
  }
}
