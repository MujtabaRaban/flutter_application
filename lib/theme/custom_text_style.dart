import 'package:firebase_auth_youtube/core/size_utils.dart';
import 'package:firebase_auth_youtube/theme/theme_helper.dart';
import 'package:flutter/material.dart';


/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLarge18 => theme.textTheme.bodyLarge!.copyWith(
        fontSize: 18.fSize,
      );
  static get bodyLargeBlue50 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.blue50,
        fontSize: 18.fSize,
      );
  static get bodyLargeCustom => theme.textTheme.bodyLarge!.custom;
  static get bodyLargeCustomErrorContainer =>
      theme.textTheme.bodyLarge!.custom.copyWith(
        color: theme.colorScheme.errorContainer,
      );
  static get bodyLargeCustomErrorContainer_1 =>
      theme.textTheme.bodyLarge!.custom.copyWith(
        color: theme.colorScheme.errorContainer.withOpacity(0.5),
      );
  static get bodyLargeCustomRedA700 =>
      theme.textTheme.bodyLarge!.custom.copyWith(
        color: appTheme.redA700,
      );
  static get bodyLargeDeeppurpleA100 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.deepPurpleA100,
      );
  static get bodyLargeIndigo50 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.indigo50,
      );
  static get bodyLargeIndigo900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.indigo900,
      );
  static get bodyLargeOnPrimaryContainer => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get bodyLargeOnPrimaryContainer_1 =>
      theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get bodyLargeOnSecondaryContainer =>
      theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onSecondaryContainer,
        fontSize: 18.fSize,
      );
  static get bodyLargeOnSecondaryContainer_1 =>
      theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onSecondaryContainer,
      );
  static get bodyLargeSecondaryContainer => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.secondaryContainer,
        fontSize: 18.fSize,
      );
  static get bodyLargeTealA200 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.tealA200,
        fontSize: 18.fSize,
      );
  static get bodyLarge_1 => theme.textTheme.bodyLarge!;
  static get bodyMediumBlue50 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blue50,
      );
  static get bodyMediumBluegray900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray900,
      );
  static get bodyMediumIndigo10001 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.indigo10001,
      );
  static get bodyMediumIndigo50 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.indigo50,
      );
  static get bodyMediumOnPrimaryContainer =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get bodyMediumSecondaryContainer =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.secondaryContainer,
      );
  static get bodyMediumWhiteA700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodySmallCustomWhiteA700 =>
      theme.textTheme.bodySmall!.custom.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodySmallCustomWhiteA700_1 =>
      theme.textTheme.bodySmall!.custom.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodySmallCyan900 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.cyan900,
      );
  static get bodySmallGray50 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray50,
      );
  static get bodySmallIndigo50 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.indigo50,
      );
  static get bodySmallOnError => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onError,
      );
  static get bodySmallOnPrimaryContainer => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get bodySmallPrimaryContainer => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
  static get bodySmallSecondaryContainer => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.secondaryContainer,
      );
  // Headline text style
  static get headlineLargeGray100 => theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.gray100,
      );
  // Title text style
  static get titleLargeBlue50 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.blue50,
      );
  static get titleLargeDeeppurple300 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.deepPurple300,
      );
  static get titleLargeGray50 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray50,
      );
  static get titleLargeOnPrimaryContainer =>
      theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get titleLargeOnPrimaryContainer_1 =>
      theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get titleLargeRed500 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.red500,
        fontSize: 22.fSize,
      );
  static get titleMediumErrorContainer => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.errorContainer,
      );
}

extension on TextStyle {
  TextStyle get abel {
    return copyWith(
      fontFamily: 'Abel',
    );
  }

  TextStyle get abhayaLibreMedium {
    return copyWith(
      fontFamily: 'Abhaya Libre Medium',
    );
  }

  TextStyle get custom {
    return copyWith(
      fontFamily: '?????',
    );
  }
}
