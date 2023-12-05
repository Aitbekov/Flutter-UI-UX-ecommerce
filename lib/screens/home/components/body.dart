import 'package:ecommerce/screens/home/components/popular_products.dart';
import 'package:ecommerce/components/product_card.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/Product.dart';
import 'package:ecommerce/screens/home/components/categories.dart';
import 'package:ecommerce/screens/home/components/discount_banner.dart';
import 'package:ecommerce/screens/home/components/home_header.dart';
import 'package:ecommerce/screens/home/components/search_field.dart';
import 'package:ecommerce/screens/home/components/section_title.dart';
import 'package:ecommerce/screens/home/components/special_offers.dart';
import 'package:ecommerce/screens/login_success/components/icon_btn_with_counter.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          const HomeHeader(),
          SizedBox(
            height: getProportionateScreenWidth(30),
          ),
          const DiscountBanner(),
          SizedBox(
            height: getProportionateScreenWidth(30),
          ),
          const Categories(),
          SizedBox(
            height: getProportionateScreenWidth(30),
          ),
          const SpecialOffers(),
          SizedBox(
            height: getProportionateScreenWidth(30),
          ),
          const PopularProducts(),
          SizedBox(
            height: getProportionateScreenWidth(30),
          ),
        ],
      ),
    ));
  }
}
