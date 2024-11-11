// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_fonts.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AppFontsV2CWProxy {
  AppFontsV2 color(Color? color);

  AppFontsV2 fontSize(double? fontSize);

  AppFontsV2 fontWeight(FontWeight? fontWeight);

  AppFontsV2 decoration(TextDecoration? decoration);

  AppFontsV2 fontStyle(FontStyle? fontStyle);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AppFontsV2(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AppFontsV2(...).copyWith(id: 12, name: "My name")
  /// ````
  AppFontsV2 call({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    FontStyle? fontStyle,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAppFontsV2.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAppFontsV2.copyWith.fieldName(...)`
class _$AppFontsV2CWProxyImpl implements _$AppFontsV2CWProxy {
  const _$AppFontsV2CWProxyImpl(this._value);

  final AppFontsV2 _value;

  @override
  AppFontsV2 color(Color? color) => this(color: color);

  @override
  AppFontsV2 fontSize(double? fontSize) => this(fontSize: fontSize);

  @override
  AppFontsV2 fontWeight(FontWeight? fontWeight) => this(fontWeight: fontWeight);

  @override
  AppFontsV2 decoration(TextDecoration? decoration) =>
      this(decoration: decoration);

  @override
  AppFontsV2 fontStyle(FontStyle? fontStyle) => this(fontStyle: fontStyle);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AppFontsV2(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AppFontsV2(...).copyWith(id: 12, name: "My name")
  /// ````
  AppFontsV2 call({
    Object? color = const $CopyWithPlaceholder(),
    Object? fontSize = const $CopyWithPlaceholder(),
    Object? fontWeight = const $CopyWithPlaceholder(),
    Object? decoration = const $CopyWithPlaceholder(),
    Object? fontStyle = const $CopyWithPlaceholder(),
  }) {
    return AppFontsV2._(
      color: color == const $CopyWithPlaceholder()
          ? _value.color
      // ignore: cast_nullable_to_non_nullable
          : color as Color?,
      fontSize: fontSize == const $CopyWithPlaceholder()
          ? _value.fontSize
      // ignore: cast_nullable_to_non_nullable
          : fontSize as double?,
      fontWeight: fontWeight == const $CopyWithPlaceholder()
          ? _value.fontWeight
      // ignore: cast_nullable_to_non_nullable
          : fontWeight as FontWeight?,
      decoration: decoration == const $CopyWithPlaceholder()
          ? _value.decoration
      // ignore: cast_nullable_to_non_nullable
          : decoration as TextDecoration?,
      fontStyle: fontStyle == const $CopyWithPlaceholder()
          ? _value.fontStyle
      // ignore: cast_nullable_to_non_nullable
          : fontStyle as FontStyle?,
    );
  }
}

extension $AppFontsV2CopyWith on AppFontsV2 {
  /// Returns a callable class that can be used as follows: `instanceOfAppFontsV2.copyWith(...)` or like so:`instanceOfAppFontsV2.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AppFontsV2CWProxy get copyWith => _$AppFontsV2CWProxyImpl(this);
}
