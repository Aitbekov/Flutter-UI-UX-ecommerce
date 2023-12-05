import 'package:ecommerce/components/custom_suffix_icon.dart';
import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/components/form_error.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/forgot_password/forgot_password_screen.dart';
import 'package:ecommerce/screens/login_success/login_success_screen.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  bool remember = false;

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
            Row(
              children: [
                Checkbox(
                    activeColor: kPrimaryColor,
                    value: remember, onChanged: (value) {
                  setState(() {
                    remember = value!;
                  });
                }),
                const Text('Remember me'),
                const Spacer(),
                GestureDetector(
                  onTap: ()=> Navigator.pushNamed(context, ForgotPasswordScreen.routeName),
                  child: const Text(
                    'Forgot Password',
                    style: TextStyle(decoration: TextDecoration.underline),
                  )
                ),

              ],
            ),
            FormError(errors: errors),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            DefaultButton(
              text: 'Continue',
              press: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                }
              },
            ),


          ],
        ));
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        onSaved: (newValue) => email = newValue!,
        onChanged: (value) {
          if (value.isNotEmpty) {
              removeError(error: kEmailNullError);
          } else if (emailValidatorRegExp.hasMatch(value) &&
              errors.contains(kInvalidEmailError)) {
              removeError(error: kInvalidEmailError);
          }
          return;
        },
        validator: (value) {
          if (value!.isEmpty) {
              addError(error: kEmailNullError);
            return '';

          } else if (!emailValidatorRegExp.hasMatch(value) &&
              !errors.contains(kInvalidEmailError)) {
              addError(error: kInvalidEmailError);
            return '';

          }
          return null;
        },
        decoration: const InputDecoration(
          labelText: 'Email',
          hintText: 'Enter your email',
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
              removeError(error: kPassNullError);
          } else if (value.length >= 8 && errors.contains(kShortPassError)) {
             removeError(error: kShortPassError);
          }
          return;
        },
        validator: (value) {
          if (value!.isEmpty) {
             addError(error: kPassNullError);
            return '';
          } else if (value.length < 8) {
             addError (error: kShortPassError);
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
}
