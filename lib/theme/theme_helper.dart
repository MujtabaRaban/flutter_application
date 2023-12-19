import 'dart:ui';
import 'package:firebase_auth_youtube/core/pref_utils.dart';
import 'package:firebase_auth_youtube/core/size_utils.dart';
import 'package:flutter/material.dart';

/// Helper class for managing themes and colors.
class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.blueGray90003,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0.h),
              topRight: Radius.circular(0.h),
              bottomLeft: Radius.circular(40.h),
              bottomRight: Radius.circular(40.h),
            ),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 16.fSize,
          fontFamily: 'Abel',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.blueGray90001,
          fontSize: 14.fSize,
          fontFamily: 'Abel',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.blue50,
          fontSize: 12.fSize,
          fontFamily: 'Abel',
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 32.fSize,
          fontFamily: '?????',
          fontWeight: FontWeight.w400,
        ),
        titleLarge: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 20.fSize,
          fontFamily: 'Abel',
          fontWeight: FontWeight.w400,
        ),
        titleMedium: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 16.fSize,
          fontFamily: 'Abhaya Libre Medium',
          fontWeight: FontWeight.w500,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFF0F172A),
    primaryContainer: Color(0XFF14736D),
    secondaryContainer: Color(0XFF171717),

    // Error colors
    errorContainer: Color(0XFF272727),
    onError: Color(0XFF131313),
    onErrorContainer: Color(0XFFD5DDF0),

    // On colors(text colors)
    onPrimary: Color(0XFF9074FF),
    onPrimaryContainer: Color(0XFF0C0C0C),
    onSecondaryContainer: Color(0XFF91A5C4),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Blue
  Color get blue50 => Color(0XFFE8F1FF);

  // BlueGray
  Color get blueGray100 => Color(0XFFD9D9D9);
  Color get blueGray700 => Color(0XFF475569);
  Color get blueGray70001 => Color(0XFF495464);
  Color get blueGray800 => Color(0XFF334155);
  Color get blueGray80000 => Color(0X00353E4B);
  Color get blueGray900 => Color(0XFF1E3556);
  Color get blueGray90001 => Color(0XFF0E1F39);
  Color get blueGray90002 => Color(0XFF273346);
  Color get blueGray90003 => Color(0XFF1E293B);

  // Cyan
  Color get cyan900 => Color(0XFF115E59);

  // DeepOrange
  Color get deepOrange700 => Color(0XFFEF3D23);

  // DeepPurple
  Color get deepPurple300 => Color(0XFF8E6CEE);
  Color get deepPurpleA100 => Color(0XFFAF9BFF);
  Color get deepPurpleA200 => Color(0XFF8466FE);
  Color get deepPurpleA20001 => Color(0XFF704DFE);

  // Gray
  Color get gray100 => Color(0XFFF4F4F4);
  Color get gray50 => Color(0XFFF2F7FF);

  // Indigo
  Color get indigo100 => Color(0XFFC4CFE1);
  Color get indigo10001 => Color(0XFFBBCCE7);
  Color get indigo200 => Color(0XFFA1B3CD);
  Color get indigo50 => Color(0XFFD9E4F5);
  Color get indigo900 => Color(0XFF19007D);

  // Indigoe
  Color get indigo9001e => Color(0X1E110058);

  // Red
  Color get red500 => Color(0XFFFA3636);
  Color get redA700 => Color(0XFFC80000);

  // Teal
  Color get tealA100 => Color(0XFF99F6E3);
  Color get tealA10001 => Color(0XFF99F6E4);
  Color get tealA200 => Color(0XFF5EEAD4);

  // White
  Color get whiteA700 => Color(0XFFFFFFFF);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
