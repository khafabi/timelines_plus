import 'package:flutter/material.dart';

/// App Colors
///
/// ![](https://www.figma.com/file/wS5qXMNXONIRbuBi2yLICm/Yapos-ERP?node-id=2980%3A79814)
class AppColors {
  AppColors._();

  MaterialColor get neutral => const MaterialColor(
    0xFF27364B, // 80
    <int, Color>{
      0: Colors.white,
      10: Color(0xFFF6F8FC), // Background
      20: Color(0xFFF1F4F9),
      30: Color(0xFFE2E8F0), // Disabled Button
      40: Color(0xFFCBD4E1), // Border
      50: Color(0xFF94A3B8), // Disabled Button Font
      60: Color(0xFF64748B), // Light Font
      70: Color(0xFF475569), // Gray Font
      80: Color(0xFF27364B), // Primary Font
      90: Color(0xFF1E2A3B),
      100: Color(0xFF0F1A2A), // Dark Font
    },
  );

  Color get white => neutral[0]!;

  Color get background => neutral[10]!;

  Color get backgroundTextField => neutral[20]!;

  Color get disabledButton => neutral[30]!;

  Color get neutralHover => neutral[30]!;

  Color get border => neutral[40]!;

  Color get disabledButtonFont => neutral[50]!;

  Color get placeholder => neutral[50]!;

  Color get neutralIcon => neutral[50]!;

  Color get lightFont => neutral[60]!;

  Color get grayFont => neutral[70]!;

  Color get font => neutral[80]!;

  Color get black => neutral[100]!;

  MaterialColor get primary => const MaterialColor(
    0xFF3C5CA9, // 20
    <int, Color>{
      0: Color(0xFFF2F5FC),
      10: Color(0xFFD0D5E2),
      20: Color(0xFF3C5CA9),
      30: Color(0xFF2D4785),
      40: Color(0xFF1D2D54),
    },
  );

  MaterialColor get primarySwatch => const MaterialColor(
    0xFF3C5CA9, // 20
    <int, Color>{
      50: Color(0xFFF2F5FC),
      100: Color(0xFFBEC9E2),
      200: Color(0xFF9DADD4),
      300: Color(0xFF7D92C6),
      400: Color(0xFF5D77B7),
      500: Color(0xFF3C5CA9),
      600: Color(0xFF324D8D),
      700: Color(0xFF283D71),
      800: Color(0xFF1E2E55),
      900: Color(0xFF141F38),
    },
  );

  MaterialColor get gradient => const MaterialColor(
    0xFF3C5CA9, // 20
    <int, Color>{
      0: Color(0xFF3C5CA9),
      10: Color(0xFF587FDD),
    },
  );

  MaterialColor get secondary => const MaterialColor(
    0xFF5E81F4, // 20
    <int, Color>{
      0: Color(0xFFDFE6FD),
      10: Color(0xFFC9D5FB),
      20: Color(0xFF5E81F4),
      30: Color(0xFF4E6BCB),
      40: Color(0xFF2F407A),
    },
  );

  MaterialColor get info => const MaterialColor(
    0xFF3267E3, // 20
    <int, Color>{
      0: Color(0xFFF0F3FF),
      10: Color(0xFFB1C5F6),
      20: Color(0xFF3267E3),
      30: Color(0xFF114CD6),
      40: Color(0xFF11317D),
    },
  );

  MaterialColor get success => const MaterialColor(
    0xFF25C196, // 20
    <int, Color>{
      0: Color(0xFFE1F9F2),
      10: Color(0xFFB6EADC),
      20: Color(0xFF25C196),
      30: Color(0xFF1FA17D),
      40: Color(0xFF20563C),
    },
  );

  MaterialColor get warning => const MaterialColor(
    0xFFCD7B2E, // 20
    <int, Color>{
      0: Color(0xFFFFF9F2),
      10: Color(0xFFEECEB0),
      20: Color(0xFFCD7B2E),
      30: Color(0xFFBF6919),
      40: Color(0xFF734011),
    },
  );

  MaterialColor get error => const MaterialColor(
    0xFFFF006C, // 20
    <int, Color>{
      0: Color(0xFFFFF5F9),
      10: Color(0xFFFFAACE),
      20: Color(0xFFFF006C),
      30: Color(0xFFD42A72),
      40: Color(0xFF800036),
    },
  );

  Gradient get primaryGradient => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [gradient.surface, gradient.splash],
  );

  Gradient get mobileBackgroundGradient => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.topRight,
    colors: [gradient.surface, gradient.splash],
  );

  ThemeData get primaryDatePicker =>
      ThemeData.light(useMaterial3: false).copyWith(
        primaryColor: primary,
        colorScheme: ColorScheme.light(primary: primary),
        buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
      );

  List<Color> get BACKGROUND_COLORS => [
    const Color(0xFFF0F3FF),
    const Color(0xFFFFF9F2),
    const Color(0xFFDFE6FD),
    const Color(0xFFFFF5F9),
    const Color(0xFFE1F9F2),
    const Color(0xFFFAEBFF),
    const Color(0xFFFFF8DD),
    const Color(0xFFE8E8EA),
  ];

  List<Color> get FOREGROUND_COLORS => [
    const Color(0xFF3267E3),
    const Color(0xFFCD7B2E),
    const Color(0xFF5E81F4),
    const Color(0xFFFF006C),
    const Color(0xFF25C196),
    const Color(0xFFA660BA),
    const Color(0xFFD6AD00),
    const Color(0xFF34303E),
  ];
}

/// Example: appColors.primary.surface
AppColors get appColors {
  return AppColors._();
}

extension AliasMaterialColor on MaterialColor {
  Color get surface => this[0] ?? this;

  Color get splash => this[10] ?? this;

  Color get main => this[20] ?? this;

  Color get hover => this[30] ?? this;

  Color get pressed => this[40] ?? this;
}
