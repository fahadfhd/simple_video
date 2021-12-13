// ignore_for_file: non_constant_identifier_names, duplicate_ignore, unnecessary_string_interpolations, unused_field

import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:sample_vid/utils/styles.dart';
import 'package:sample_vid/views/dashboard/screens/dashboard.dart';
import 'package:sample_vid/views/dashboard/video_player.dart';
import 'package:sample_vid/views/screens/profile.dart';

class OtpView extends StatefulWidget {
  final String? email;
  final String? pass;
  final String? phone;
  final String? code_digit;
  final String? dob;
  static const route = "/otpscreen";
  // ignore: non_constant_identifier_names
  const OtpView(
      {Key? key, this.phone, this.code_digit, this.email, this.pass, this.dob})
      : super(key: key);

  @override
  _OtpViewState createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final TextEditingController pinOtpController = TextEditingController();
  final FocusNode pinOtpFocus = FocusNode();

  String? verificationId;
  final BoxDecoration pinOtpDecoration = BoxDecoration(
    color: Colors.blueAccent,
    border: Border.all(color: Colors.black),
    borderRadius: BorderRadius.circular(10.0),
  );

  @override
  void initState() {
    super.initState();

    verifyPhoneNumber();
  }

  verifyPhoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "${widget.code_digit! + widget.phone!}",
        // phoneNumber: "+919562593194",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) {
            if (value.user != null) {
              // Navigator.pushNamed(context,  VideoPlayerView());
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (c) => Dashboard()));
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(e.message.toString()),
            // ignore: prefer_const_constructors
            duration: Duration(seconds: 3),
          ));
        },
        codeSent: (String vID, int? resentToken) {
          setState(() {
            verificationId = vID;
          });
        },
        codeAutoRetrievalTimeout: (String vID) {
          setState(() {
            verificationId = vID;
          });
        },
        timeout: const Duration(seconds: 60));
  }

  @override
  Widget build(BuildContext context) {
    print("---------widget-------${widget.code_digit}");
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Padding(padding: const EdgeInsets.all(8.0),
          // child: ,)
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  verifyPhoneNumber();
                },
                child: Text(
                  "Verifying : ${widget.code_digit} ${widget.phone}",
                  style: tsS16Black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: PinPut(
              fieldsCount: 6,
              textStyle: tsS18BLUE,
              eachFieldHeight: 55.0,
              eachFieldWidth: 40.0,
              focusNode: pinOtpFocus,
              controller: pinOtpController,
              submittedFieldDecoration: pinOtpDecoration,
              selectedFieldDecoration: pinOtpDecoration,
              followingFieldDecoration: pinOtpDecoration,
              pinAnimationType: PinAnimationType.rotation,
              onSubmit: (pin) async {
                try {
                  await FirebaseAuth.instance
                      .signInWithCredential(PhoneAuthProvider.credential(
                          verificationId: verificationId!, smsCode: pin))
                      .then((value) {
                    if (value.user != null) {
                      Navigator.pushNamed(
                        context,
                        Dashboard.route,
                      );
                      // Navigator.of(context)
                      //     .push(MaterialPageRoute(builder: (c) => Dashboard()));
                    }
                  });
                } catch (e) {
                  FocusScope.of(context).unfocus();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Invalid Otp"),
                    duration: Duration(seconds: 3),
                  ));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
