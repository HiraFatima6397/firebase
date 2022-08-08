import 'dart:async';

import 'package:firebase_auth1/constant/color.dart';
import 'package:firebase_auth1/constant/string_constant.dart';
import 'package:firebase_auth1/constant/style.dart';
import 'package:firebase_auth1/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({Key? key}) : super(key: key);

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  int Start = 30;
  bool wait = false;
  String buttonName = StringConstant.send;
  TextEditingController phonecontroller=TextEditingController();
  AuthClass authClass=AuthClass();
  String verificationId='';
  String smsCode='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        title: Text(StringConstant.signUp),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(
              width: 150,
            ),
            textfield(),
            SizedBox(
              height: 20,
            ),
            Text(
              StringConstant.otpSend,
              style:
                  AppStyles.regularText(fontSize: 20, color: AppColors.white),
            ),
            SizedBox(
              height: 20,
            ),
            otpfield(),
            SizedBox(
              height: 40,
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: StringConstant.sentOtpIn,
                    style: AppStyles.regularText(
                        fontSize: 20, color: AppColors.yellow)),
                TextSpan(
                    text: '00.$Start',
                    style: AppStyles.regularText(
                        fontSize: 20, color: AppColors.pink)),
                TextSpan(
                    text: StringConstant.sec,
                    style: AppStyles.regularText(
                        fontSize: 20, color: AppColors.yellow)),
              ]),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.yellow,
              ),child: Center(child: Text(StringConstant.letsGo, style: AppStyles.regularText(fontSize: 20,color: AppColors.white))),
            )
          ],
        ),
      ),
    );
  }

  void StartTimer() {
    const onsec = Duration(seconds: 1);
    Timer timer = Timer.periodic(onsec, (timer) {
      if (Start == 0) {
        setState(() {
          timer.cancel();
          wait = false;
        });
      } else {
        setState(() {
          Start--;
        });
      }
    });
  }

  Widget otpfield() {
    return OTPTextField(
      length: 5,
      width: MediaQuery.of(context).size.width - 34,
      fieldWidth: 50,
      otpFieldStyle: OtpFieldStyle(
          backgroundColor: AppColors.grey, borderColor: AppColors.white),
      style: TextStyle(fontSize: 17),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.underline,
      onCompleted: (pin) {
        print("Completed: " + pin);
      },
    );
  }

  Widget textfield() {
    return Container(
        width: MediaQuery.of(context).size.width - 40,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextFormField(
          controller: phonecontroller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: StringConstant.enterYourNumber,
            hintStyle:
                AppStyles.regularText(fontSize: 15, color: AppColors.white),
            contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 15),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Text(StringConstant.icon,
                  style: AppStyles.regularText(
                      fontSize: 20, color: AppColors.white)),
            ),
            suffixIcon: InkWell(
              onTap: wait
                  ? null
                  : () {
                      StartTimer();
                      setState(() {
                        Start = 30;
                        wait = true;
                        buttonName = StringConstant.resend;
                      });
                      authClass.VerifyPhoneNumber('+91${phonecontroller.text}', context,setData);
                    },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Text(buttonName,
                    style: AppStyles.regularText(
                        fontSize: 20,
                        color: wait ? Colors.red : AppColors.white)),
              ),
            ),
          ),
        ));
  }
  void setData(verificationId){
    setState(() {
      verificationId=verificationId;
    });
    StartTimer();
  }
}
