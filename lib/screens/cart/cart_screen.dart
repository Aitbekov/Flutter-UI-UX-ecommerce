import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'components/body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static String routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
appBar:  buildAppBar(context),
body: Body(),
bottomNavigationBar: Container(
  padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15), horizontal: getProportionateScreenWidth(30)),
  //height: 174,

  decoration: BoxDecoration(color: Colors.white, 
  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
  boxShadow: [BoxShadow(offset: Offset(0, -15),
  blurRadius: 20, 
  color: Color(0xFFADADA).withOpacity(0.15),
  )]),
  child: 
  SafeArea(child: 
  Column(
    mainAxisSize: MainAxisSize.min,
    children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: getProportionateScreenWidth(40),
              width: getProportionateScreenWidth(40),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset('assets/icons/receipt.svg'),
            ),
            Spacer(),
            Text('add voucher code'),
            SizedBox(width: 10,),
            Icon(Icons.arrow_forward_ios, size: 12, color: kTextColor,)
          ],
        ),
        SizedBox(height: getProportionateScreenWidth(20),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                text: 'Total:\n',
                children: [
                  TextSpan(
                    text: '\$337.15',
                    style: TextStyle(fontSize: 16, color: Colors.black)
                  )
                ]

              )
            ),
            SizedBox(width: getProportionateScreenWidth(190),
            child: DefaultButton(text: 'Check Out', press: (){}),
            ),
          ],
        )
    ],
  ),
),
)
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(title: Column(
  children: [
    Text('Your Cart',
    style: TextStyle(color: Colors.black),
    ),
    Text('${demoCarts.length} items',
    style: Theme.of(context).textTheme.caption,)
  ],
),);
  }
}