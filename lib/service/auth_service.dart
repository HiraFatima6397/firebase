import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth1/sign_in/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthClass {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  FirebaseAuth auth = FirebaseAuth.instance;

  AuthCredential get credential => credential;
  Future<void> googleSignIn(BuildContext context) async {
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );
        try {
          UserCredential userCredential =
              await auth.signInWithCredential(credential);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (builder) => SignIn()),
              (route) => false);
        } catch (e) {}
      } else {}
    } catch (e) {}
  }

  Future<void> VerifyPhoneNumber(
      String phoneNumber, BuildContext context, Function setData) async {
    PhoneVerificationCompleted VerificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {};
    PhoneVerificationFailed VerificationFailed =
        (FirebaseAuthException) async {};
    PhoneCodeSent CodeSent =
        (String verificationId, [int? forceResendingtoken]) {};
    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {};
    try {
      await auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: VerificationCompleted,
          verificationFailed: VerificationFailed,
          codeSent: CodeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {}
  }

  Future<void> signInwithPhoneNumber(
      String verificationId, String smsCode) async {
    try {
      AuthCredential authCredential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      UserCredential userCredential =
      await auth.signInWithCredential(credential);
    } catch (e) {}
  }
}
