// ignore_for_file: avoid_print, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sample_vid/common_widgets/common_button.dart';
import 'package:sample_vid/common_widgets/common_text_field.dart';
import 'package:sample_vid/utils/colors.dart';
import 'package:sample_vid/utils/styles.dart';
import 'package:sample_vid/views/screens/otp_view.dart';

class LoginView extends StatefulWidget {
  static const String route = '/login';
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController countryDigitController = TextEditingController();
  final TextEditingController DobController = TextEditingController();
  bool visible = true;
  bool _isLoginClicked = false;
  final _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(color: colorffffff),
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 99),
            child: SafeArea(
              child: Form(
                key: _keyForm,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      height(150),
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: IntlPhoneField(
                            iconPosition: IconPosition.trailing,
                            decoration: const InputDecoration(
                              labelStyle:
                                  TextStyle(fontSize: 14.0, color: color21609e),
                              labelText: "Mobile Number",
                              border: UnderlineInputBorder(),
                            ),
                            initialCountryCode: 'IN',
                            onChanged: (phone) {
                              // ignore: avoid_print
                              print(phone.completeNumber);
                              // mobile_number = phone.number;
                              // print(mobile_number);
                              countryDigitController.text =
                                  phone.countryCode.toString();
                              print(
                                  "-----------${countryDigitController.text}");
                              mobileController.text = phone.number.toString();
                            },
                          ),
                        ),
                      ),
                      height(10),
                      SizedBox(
                        height: 70,
                        child: CommonTextField(
                          hPadding: 0,
                          hint: 'Email',
                          textEditingController: emailController,
                          onChanged: (value) {
                            setState(() {
                              _isLoginClicked = false;
                            });
                            _keyForm.currentState!.validate();
                          },
                          prefix: const InkWell(
                            child: SizedBox(
                              width: 1,
                              child: Padding(
                                padding: EdgeInsets.only(left: 3),
                                child: Icon(Icons.email_outlined),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (!_isLoginClicked) {
                              return null;
                            }
                            if (value?.toString().trim().isEmpty ?? false) {
                              return "Email address is required.";
                            }
                          },
                        ),
                      ),
                      height(5),
                      SizedBox(
                        height: 70,
                        child: CommonTextField(
                          hPadding: 0,
                          hint: 'Password',
                          prefix: const InkWell(
                            child: SizedBox(
                              width: 1,
                              child: Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Icon(Icons.lock),
                              ),
                            ),
                          ),
                          sufix: InkWell(
                            onTap: () {
                              setState(() {
                                visible = !visible;
                              });
                            },
                            child: SizedBox(
                              width: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 18.0),
                                child: Icon(
                                  Icons.visibility,
                                  color: visible ? colorBlack : color21609e,
                                ),
                              ),
                            ),
                          ),
                          obscureText: visible,
                          textEditingController: passwordController,
                          onChanged: (s) {
                            // provider.validatePassword(s.toString());
                            setState(() {
                              _isLoginClicked = false;
                            });
                            _keyForm.currentState!.validate();
                          },
                          validator: (value) {
                            if (!_isLoginClicked) {
                              return null;
                            }
                            if (value?.toString().trim().isEmpty ?? true) {
                              return "Password is required.";
                            } else if (value.toString().length < 6) {
                              return "Password must be 6 characters long";
                            }
                          },
                        ),
                      ),
                      height(10),
                      CommonTextField(
                        hint: "DOB",
                        hPadding: 0,
                        textEditingController: DobController,
                      ),
                      height(10),
                      CommonButton(
                        hPadding: 0,
                        buttonName: 'Login',
                        style: tsS18FFFFF,
                        color: color21609e,
                        function: () {
                          _isLoginClicked = true;
                          FocusScope.of(context).unfocus();
                          if (_keyForm.currentState!.validate()) {
                            print("no");
                            print(
                                "mob ----------- ${mobileController.text},-- ${countryDigitController.text}");
                            Navigator.pushNamed(
                              context,
                              OtpView.route,
                              arguments: OtpView(
                                  phone: mobileController.text,
                                  code_digit: countryDigitController.text,
                                  email: emailController.text,
                                  pass: passwordController.text,
                                  dob: DobController.text),
                            );
                          } else {
                            print("yes");
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

SizedBox height(double height) {
  return SizedBox(
    height: height,
  );
}

SizedBox width(double width) {
  return SizedBox(
    width: width,
  );
}
