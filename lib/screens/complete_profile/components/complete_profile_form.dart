import 'package:ecommerce/components/custom_suffix_icon.dart';
import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/components/form_error.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/otp/otp_screen.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({super.key});

  @override
  State<CompleteProfileForm> createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  late final String firstName;
  late String lastName;
  late String phoneNumber;
  late String address;

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            buildNameFormField(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            buildLastFormField(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            buildPhoneNumberFormField(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            buildAddressFormField(),
            FormError(errors: errors),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            DefaultButton(text: 'Continue', press: (){
              if(_formKey.currentState!.validate()){
               Navigator.pushNamed(context, OtpScreen.routeName);
              }
            },)
          ],
        ));
  }

  TextFormField buildNameFormField() {
    return TextFormField(
        onSaved: (newValue) => firstName = newValue!,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kNamelNullError);
          }
          return;
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: kNamelNullError);
            return '';
          }
          return null;
        },
        decoration: const InputDecoration(
          labelText: 'First Name',
          hintText: 'Enter your first name',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/User.svg'),
        ));
  }

  TextFormField buildLastFormField() {
    return TextFormField(
        onSaved: (newValue) => lastName = newValue!,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kNamelNullError);
          }
          return;
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: kNamelNullError);
            return '';
          }
          return null;
        },
        decoration: const InputDecoration(
          labelText: 'Last Name',
          hintText: 'Enter your last name',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/User.svg'),
        ));
  }


  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
        keyboardType: TextInputType.number,
        onSaved: (newValue) => phoneNumber = newValue!,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kPhoneNumberNullError);
          }
          return;
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: kPhoneNumberNullError);
            return '';
          }
          return null;
        },
        decoration: const InputDecoration(
          labelText: 'Phone Number',
          hintText: 'Enter your phone number',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon:
          CustomSuffixIcon(svgIcon: 'assets/icons/Phone.svg'),
        ));
  }

  TextFormField buildAddressFormField(){
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        onSaved: (newValue) => address = newValue!,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kAddressNullError);
          }
          return;
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: kAddressNullError);
            return '';
          }
          return null;
        },
        decoration: const InputDecoration(
          labelText: 'Address',
          hintText: 'Enter your address',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon:
          CustomSuffixIcon(svgIcon: 'assets/icons/Location Point.svg'),
        ));
  }
}
