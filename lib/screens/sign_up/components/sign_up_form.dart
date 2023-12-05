import 'package:ecommerce/components/custom_suffix_icon.dart';
import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/components/form_error.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/complete_profile/complete_profile_screen.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  late String confirm_password;
  final List<String> errors = [];

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
            buildEmailFormField(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            buildPasswordFormField(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            buildConfirmPasswordFormField(),
            FormError(errors: errors),
            SizedBox(
              height: getProportionateScreenHeight(40),
            ),
            DefaultButton(
              text: 'Continue',
              press: () {
                if (_formKey.currentState!.validate()) {

                  Navigator.pushNamed(context, CompleteProfileScreen.routeName);
                }
              },
            )
          ],
        ));
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        onSaved: (newValue) => email = newValue!,
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(kEmailNullError)) {
            setState(() {
              removeError(error: kEmailNullError);
            });
          } else if (emailValidatorRegExp.hasMatch(value) &&
              errors.contains(kInvalidEmailError)) {
            setState(() {
              removeError(error: kInvalidEmailError);
            });
          }
          return;
        },
        validator: (value) {
          if (value!.isEmpty && !errors.contains(kEmailNullError)) {
            setState(() {
              addError(error: kEmailNullError);
            });
            return '';
          } else if (!emailValidatorRegExp.hasMatch(value) &&
              !errors.contains(kInvalidEmailError)) {
            setState(() {
              addError(error: kInvalidEmailError);
            });
            return '';
          }
          return null;
        },
        decoration: const InputDecoration(
          labelText: 'Email',
          hintText: 'Enter you email',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Mail.svg'),
        ));
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
        obscureText: true,
        onSaved: (newValue) => password = newValue!,
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(kPassNullError)) {
            setState(() {
              removeError(error: kPassNullError);
            });
          } else if (value.length >= 8 && errors.contains(kShortPassError)) {
            setState(() {
              removeError(error: kShortPassError);
            });
          }
          password = value;
          return;
        },
        validator: (value) {
          if (value!.isEmpty && !errors.contains(kPassNullError)) {
            setState(() {
              addError(error: kPassNullError);
            });
            return '';
          } else if (value.length < 8 && !errors.contains(kShortPassError)) {
            setState(() {
              addError(error: kShortPassError);
            });
            return '';
          }
          return null;
        },
        decoration: const InputDecoration(
          labelText: 'Password',
          hintText: 'Enter your password',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Lock.svg'),
        ));
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
        obscureText: true,
        onSaved: (newValue) => confirm_password = newValue!,
        onChanged: (value) {
          if (password == confirm_password) {
            removeError(error: kMatchPassError);
          }
          return;
        },
        validator: (value) {
          if (value!.isEmpty) {
            return '';
          } else if (password != value) {
            addError(error: kMatchPassError);
            return '';
          }
          return null;
        },
        decoration: const InputDecoration(
          labelText: 'Confirm Password',
          hintText: 'Re-Enter your password',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Lock.svg'),
        ));
  }
}
