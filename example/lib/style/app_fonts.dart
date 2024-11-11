import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:example/style/app_colors.dart';
import 'package:example/style/screen_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

part 'app_fonts.gs.dart';

class AppFontsV2 {
  AppFontsV2._({
    this.fontSize,
    this.fontWeight,
    this.color,
    this.decoration,
    this.fontStyle,
  });

  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextDecoration? decoration;
  final FontStyle? fontStyle;

  TextStyle get ts {
    return GoogleFonts.nunitoSans(
      fontSize: fontSize ?? _body.fontSize,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? text.color,
      letterSpacing: 0,
      decoration: decoration,
      fontStyle: fontStyle,
    );
  }

  /// Color
  AppFontsV2 customColor(Color color) {
    return copyWith(
      color: color,
    );
  }

  AppFontsV2 get placeholder {
    return copyWith(
      color: appColors.placeholder,
    );
  }

  AppFontsV2 get text {
    return copyWith(
      color: appColors.font,
    );
  }

  AppFontsV2 get light {
    return copyWith(
      color: appColors.lightFont,
    );
  }

  AppFontsV2 get gray {
    return copyWith(
      color: appColors.grayFont,
    );
  }

  AppFontsV2 get disabled {
    return copyWith(
      color: appColors.disabledButtonFont,
    );
  }

  AppFontsV2 get primary {
    return copyWith(
      color: appColors.primary,
    );
  }

  AppFontsV2 get secondary {
    return copyWith(
      color: appColors.secondary,
    );
  }

  AppFontsV2 get white {
    return copyWith(
      color: appColors.white,
    );
  }

  AppFontsV2 get info {
    return copyWith(
      color: appColors.info,
    );
  }

  AppFontsV2 get success {
    return copyWith(
      color: appColors.success,
    );
  }

  AppFontsV2 get warning {
    return copyWith(
      color: appColors.warning,
    );
  }

  AppFontsV2 get error {
    return copyWith(
      color: appColors.error,
    );
  }

  /// Decoration
  AppFontsV2 customWeight(FontWeight fontWeight) {
    return copyWith(
      fontWeight: fontWeight,
    );
  }

  AppFontsV2 get bold {
    return copyWith(
      fontWeight: FontWeight.bold,
    );
  }

  AppFontsV2 get semibold {
    return copyWith(
      fontWeight: FontWeight.w600,
    );
  }

  AppFontsV2 get underline {
    return copyWith(
      decoration: TextDecoration.underline,
    );
  }

  AppFontsV2 get lineThrough {
    return copyWith(
      decoration: TextDecoration.lineThrough,
    );
  }

  AppFontsV2 get italic {
    return copyWith(
      fontStyle: FontStyle.italic,
    );
  }

  /// Font Size
  AppFontsV2 customSize(double fontSize) {
    return copyWith(
      fontSize: fontSize,
    );
  }

  AppFontsV2 get caption {
    return copyWith(
      fontSize: kRender(
        mobile: () => 12,
        desktop: () => 14,
      ),
    );
  }

  AppFontsV2 get _body {
    return copyWith(
      fontSize: kRender(
        mobile: () => 14,
        desktop: () => 18,
      ),
    );
  }

  AppFontsV2 get subtitle {
    return copyWith(
      fontSize: kRender(
        mobile: () => 18,
        desktop: () => 20,
      ),
    );
  }

  AppFontsV2 get titleSmall {
    return copyWith(
      fontSize: kRender(
        mobile: () => 24,
        desktop: () => 28,
      ),
    );
  }

  AppFontsV2 get title {
    return copyWith(
      fontSize: kRender(
        mobile: () => 32,
        desktop: () => 42,
      ),
    );
  }
}

/// Example: appFonts.title.ts
AppFontsV2 get appFonts {
  return AppFontsV2._();
}
