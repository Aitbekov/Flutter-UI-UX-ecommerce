import 'package:ecommerce/constants.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'otp_form.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child:
          SingleChildScrollView(child:
          Column(
            children: [
              SizedBox(height: SizeConfig.screenWidth * 0.05,), //10%
              Text(
                'OTP Verification',
                style: headingStyle,
              ),
              const Text('We sent your code to +1 898 860 ***'),
              buildTimer(),
              SizedBox(height: SizeConfig.screenWidth * 0.2,), //10%
              const OtpForm(),
              SizedBox(height: SizeConfig.screenWidth * 0.15,), //10%
              GestureDetector(
                onTap: (){},
                child:
              const Text('Resent OTP Code', style: TextStyle(
                decoration: TextDecoration.underline
              ),),),
            ],
          ),)
        ));
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('This code will expired in '),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0),
          duration: const Duration(seconds: 30),
          builder: (context, value, child) => Text(
            '00:${value.toInt()}',
            style: const TextStyle(color: kPrimaryColor),
          ),
          onEnd: () {},
        )
      ],
    );
  }
}




