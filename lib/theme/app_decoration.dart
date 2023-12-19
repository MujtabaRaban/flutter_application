import 'package:firebase_auth_youtube/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlueGray => BoxDecoration(
        color: appTheme.blueGray90003,
      );
  static BoxDecoration get fillBluegray700 => BoxDecoration(
        color: appTheme.blueGray700,
      );
  static BoxDecoration get fillBluegray800 => BoxDecoration(
        color: appTheme.blueGray800,
      );
  static BoxDecoration get fillBluegray90001 => BoxDecoration(
        color: appTheme.blueGray90001,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray100,
      );
  static BoxDecoration get fillIndigo => BoxDecoration(
        color: appTheme.indigo100,
      );
  static BoxDecoration get fillOnErrorContainer => BoxDecoration(
        color: theme.colorScheme.onErrorContainer,
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );

  // Gradient decorations
  static BoxDecoration get gradientBlueGrayToBlueGray => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.blueGray80000.withOpacity(0.8),
            appTheme.blueGray90003.withOpacity(0.8),
          ],
        ),
      );
  static BoxDecoration get gradientBlueGrayToBluegray90003 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1.24),
          colors: [
            appTheme.blueGray80000,
            appTheme.blueGray90003,
          ],
        ),
      );
  static BoxDecoration get gradientBlueGrayToBluegray900031 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0.09),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.blueGray90003,
            appTheme.blueGray90003.withOpacity(0),
          ],
        ),
      );
  static BoxDecoration get gradientBlueGrayToOnSecondaryContainer =>
      BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.06, 0.11),
          end: Alignment(1.03, 1),
          colors: [
            appTheme.blueGray70001,
            theme.colorScheme.onSecondaryContainer,
          ],
        ),
      );

  // Outline decorations
  static BoxDecoration get outlineBlueGray => BoxDecoration(
        color: appTheme.deepPurpleA20001,
        border: Border.all(
          color: appTheme.blueGray90002,
          width: 2.h,
        ),
      );
  static BoxDecoration get outlineBluegray90002 => BoxDecoration(
        color: appTheme.deepPurpleA200,
        border: Border.all(
          color: appTheme.blueGray90002,
          width: 2.h,
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder28 => BorderRadius.circular(
        28.h,
      );
  static BorderRadius get circleBorder36 => BorderRadius.circular(
        36.h,
      );
  static BorderRadius get circleBorder50 => BorderRadius.circular(
        50.h,
      );

  // Custom borders
  static BorderRadius get customBorderTL12 => BorderRadius.vertical(
        top: Radius.circular(12.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder12 => BorderRadius.circular(
        12.h,
      );
  static BorderRadius get roundedBorder16 => BorderRadius.circular(
        16.h,
      );
  static BorderRadius get roundedBorder2 => BorderRadius.circular(
        2.h,
      );
  static BorderRadius get roundedBorder5 => BorderRadius.circular(
        5.h,
      );
  static BorderRadius get roundedBorder9 => BorderRadius.circular(
        9.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
