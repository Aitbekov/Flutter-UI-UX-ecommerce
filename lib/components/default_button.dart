import 'package:ecommerce/constants.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({Key? key, required this.text, required this.press}) : super(key: key);

  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.infinity,
        height: getProportionateScreenHeight(56),
        child: TextButton(
            style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all<Color>(
                  kPrimaryColor),
              shape: MaterialStateProperty.all<
                  RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            onPressed: press,
            child: Text(
              text,
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  color: Colors.white),
            )));
  }
}

