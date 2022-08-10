
import 'package:firebase_auth1/add_todo/add_todopage.dart';
import 'package:firebase_auth1/constant/color.dart';
import 'package:firebase_auth1/constant/icon.dart';
import 'package:firebase_auth1/constant/image.dart';
import 'package:firebase_auth1/constant/string_constant.dart';
import 'package:firebase_auth1/constant/style.dart';
import 'package:firebase_auth1/phone_auth/phone_auth.dart';
import 'package:firebase_auth1/service/auth_service.dart';
import 'package:firebase_auth1/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _pwdcontroller = TextEditingController();
  bool circular = false;

  AuthClass authClass=AuthClass();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  AppImages.icon,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 520,
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      bottomRight: const Radius.circular(100),
                    ),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.grey,
                          spreadRadius: 10,
                          blurRadius: 20,
                          offset: Offset(0, 5))
                    ]),
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: Column(
                    children: [
                      Text(
                        StringConstant.signUp,
                        style: AppStyles.regularText(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextField(
                          controller: _emailcontroller,
                          decoration: InputDecoration(
                              hintText: StringConstant.email,
                              hintStyle:
                              AppStyles.regularText(color: AppColors.black),
                              prefixIcon:
                              const Icon(AppIcons.person, color: AppColors.black),
                              fillColor: AppColors.grey,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)))),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: _pwdcontroller,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: StringConstant.password,
                              hintStyle:
                              AppStyles.regularText(color: AppColors.black),
                              prefixIcon:
                              const Icon(AppIcons.pass, color: AppColors.black),
                              fillColor: AppColors.grey,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)))),
                      const SizedBox(
                        height: 20,
                      ),
                  InkWell(onTap: (){
                   authClass.googleSignIn(context);
                  },
                    child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.black, width: 1),
        ),
        child: Row(
          children: [
            Image.asset(AppImages.google,height: 30,width: 30),
            const SizedBox(width: 10,),
            Text(StringConstant.continueWithGoogle,style: AppStyles.regularText(fontSize: 15,color: AppColors.black),)
          ],
        ),
      ),
                  ),


                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder:(bilder)=> const PhoneAuth()));},
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColors.black, width: 1),
                          ),
                          child: Row(
                            children: [
                              Image.asset(AppImages.phone,height: 30,width: 30),
                              const SizedBox(width: 10,),
                              Text(StringConstant.continueWithPhone,style: AppStyles.regularText(fontSize: 15,color: AppColors.black),)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),

                   colorButton(),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            StringConstant.ifYouHave,
                            style: AppStyles.regularText(
                                color: AppColors.black,
                                fontSize: 11,
                                fontWeight: FontWeight.bold),
                          ),
                          InkWell(onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder:(bilder)=> const SignIn()));
                          },
                            child: Text(StringConstant.login,style: AppStyles.regularText(
                                color: AppColors.black,
                                fontSize: 15,)
                            ),
                          ) ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget colorButton(){
    return   InkWell(
      onTap: () async {
        setState(() {
          circular = true;
        });
        try {
          firebase_auth.UserCredential usercredential =
          await firebaseAuth
              .createUserWithEmailAndPassword(
              email: _emailcontroller.text,
              password: _pwdcontroller.text);
          print(usercredential.user!.email);

          setState(() {
            circular = false;
          });
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (builder) => const SignIn()),
                  (route) => false);
        } catch (e) {
          final snackBar = SnackBar(content: Text(e.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          setState(() {
            circular = false;
          });
        }
      },
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: AppColors.black,
        ),
        child: Center(
          child:circular
              ? const CircularProgressIndicator()
              : Text(StringConstant.signUp,
              style: AppStyles.regularText(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white)),
        ),
      ),
    );
  }

}
