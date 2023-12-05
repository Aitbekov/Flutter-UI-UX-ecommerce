import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/complete_profile/components/complete_profile_form.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.02,),

            Text(
              'Complete Profile',
              style: headingStyle,
            ),
            const Text(
              'Complete your details or continue \nwith social media',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.05,),

            CompleteProfileForm(),
            SizedBox(height: getProportionateScreenHeight(30),),
            const Text('By continuing your confirm that you agree \nwith our Term and Condition',
            textAlign: TextAlign.center,),
          ],
        ),
      ),
    ));
  }
}

