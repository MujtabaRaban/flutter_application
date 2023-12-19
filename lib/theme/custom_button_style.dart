import 'dart:ui';
import 'package:firebase_auth_youtube/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillBlueGray => ElevatedButton.styleFrom(
        backgroundColor: appTheme.blueGray800,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.h),
        ),
      );
  static ButtonStyle get fillBlueGrayTL24 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.blueGray90001,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.h),
        ),
      );
  static ButtonStyle get fillBlueGray1 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.blueGray800,
      );
  static ButtonStyle get fillDeepPurple => ElevatedButton.styleFrom(
        backgroundColor: appTheme.deepPurple300,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.h),
        ),
      );
  static ButtonStyle get fillDeepPurpleA => ElevatedButton.styleFrom(
        backgroundColor: appTheme.deepPurpleA20001,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.h),
        ),
      );
  static ButtonStyle get fillDeepPurpleATL20 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.deepPurpleA20001,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.h),
        ),
      );
  static ButtonStyle get fillDeepPurpleATL24 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.deepPurpleA200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.h),
        ),
      );
  static ButtonStyle get fillDeepPurpleATL8 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.deepPurpleA200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.h),
        ),
      );
  static ButtonStyle get fillGray => ElevatedButton.styleFrom(
        backgroundColor: appTheme.gray100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.h),
        ),
      );
  static ButtonStyle get fillTealA => ElevatedButton.styleFrom(
        backgroundColor: appTheme.tealA10001,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.h),
        ),
      );
  static ButtonStyle get fillTealATL8 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.tealA100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.h),
        ),
      );
  // text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );
}
