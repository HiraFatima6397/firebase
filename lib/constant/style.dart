

import 'package:firebase_auth1/constant/color.dart';
import 'package:flutter/cupertino.dart';

class AppStyles {
  static TextStyle regularText({
    double? height,
    Color? color,
    bool isUnderline = false,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily
  }) {
    return TextStyle(
      fontSize: fontSize ?? 16,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? AppColors.grey,
      height: height,
      letterSpacing: 2,
      decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
    );

  }
}