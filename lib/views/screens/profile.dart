import 'package:flutter/material.dart';
import 'package:sample_vid/common_widgets/common_button.dart';
import 'package:sample_vid/common_widgets/common_text_field.dart';
import 'package:sample_vid/utils/colors.dart';
import 'package:sample_vid/utils/styles.dart';
import 'package:sample_vid/views/screens/login.dart';

class ProfileView extends StatefulWidget {
  final String? em;
  final String? mob;
  final String? pass;
  final String? dob;
  static const route = "profileView";

  const ProfileView({Key? key, this.em, this.mob, this.pass, this.dob})
      : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController countryDigitController = TextEditingController();
  final TextEditingController DobController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Email",
                style: tsS14BoldBlack,
              ),
            ),
            height(10),
            CommonTextField(
              hint: "Email",
              hPadding: 0,
              textEditingController: emailController,
            ),
            height(10),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Phone",
                style: tsS14BoldBlack,
              ),
            ),
            height(10),
            CommonTextField(
              hint: "Phone",
              hPadding: 0,
              keyboardtype: TextInputType.number,
              textEditingController: mobileController,
            ),
            height(10),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "password",
                style: tsS14BoldBlack,
              ),
            ),
            height(10),
            CommonTextField(
              hint: "PassWord",
              hPadding: 0,
              textEditingController: passwordController,
            ),
            height(10),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "DOB",
                style: tsS14BoldBlack,
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
              buttonName: "Update",
              color: Colors.red,
              style: tsS16BoldBLUE,
            )
          ],
        ),
      ),
    ));
  }
}
