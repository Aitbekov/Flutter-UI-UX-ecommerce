import 'package:ecommerce/components/custom_bottom_nav_bar.dart';
import 'package:ecommerce/enums.dart';
import 'package:ecommerce/screens/home/components/body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
