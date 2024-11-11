import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Screen Type
///
/// To differentiate device size
///
/// To Create New Screen Type
/// 1. Add [ScreenType]
/// 2. Add [kScreenTypes]
/// 3. Add [ScreenLayout.render]
/// 4. Add checking boolean like [ScreenLayout.isDesktop]
enum ScreenType {
  mobile,
  tablet,
  desktop,
}

class ModelScreenType {
  ModelScreenType({
    required this.type,
    required this.maxWidth,
    required this.designSize,
  });

  final ScreenType type;

  /// To determine the largest device size
  final double maxWidth;

  /// Default size for this [type]
  final Size designSize;
}

/// Initialize All Screen Type here
///
/// Must be sorted by [ModelScreenType.maxWidth]
final List<ModelScreenType> kScreenTypes = [
  ModelScreenType(
    type: ScreenType.mobile,
    maxWidth: 600,
    designSize: const Size(600, 800),
  ),
  ModelScreenType(
    type: ScreenType.tablet,
    maxWidth: 1024,
    designSize: const Size(1024, 1024),
  ),
  ModelScreenType(
    type: ScreenType.desktop,
    maxWidth: 1920,
    designSize: const Size(1920, 1080),
  ),
];

class ScreenLayout {
  const ScreenLayout._();

  static const ScreenLayout _instance = ScreenLayout._();

  static ScreenLayout get instance => _instance;

  double get deviceWidth =>
      PlatformDispatcher.instance.views.first.physicalSize.width /
      PlatformDispatcher.instance.views.first.devicePixelRatio *
      1; // DisplayUtil.scaling;

  double get ratioDeviceWidth => deviceWidth / kScreenTypes.first.maxWidth;

  /// Determine [ModelScreenType] based on [ModelScreenType.maxWidth]
  ModelScreenType get _currentModelScreenType {
    for (final screenType in kScreenTypes) {
      if (deviceWidth <= screenType.maxWidth) {
        return screenType;
      }
    }

    return kScreenTypes.last;
  }

  ScreenType get currentScreenType => _currentModelScreenType.type;

  Size get currentDesignSize => _currentModelScreenType.designSize;

  Size? getDesignSize(ScreenType screenType) {
    for (final kScreenType in kScreenTypes) {
      if (screenType == kScreenType.type) {
        return kScreenType.designSize;
      }
    }

    return null;
  }

  /// Render data based on Current Screen Type
  T render<T>({
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    final screenType = ScreenLayout.instance.currentScreenType;

    if (screenType == ScreenType.desktop) {
      if (desktop != null) {
        return desktop;
      } else if (tablet != null) {
        return tablet;
      }
    } else if (screenType == ScreenType.tablet) {
      if (tablet != null) {
        return tablet;
      }
    }

    return mobile;
  }

  bool get isDesktop => currentScreenType == ScreenType.desktop;

  bool get isTablet => currentScreenType == ScreenType.tablet;

  bool get isMobile => currentScreenType == ScreenType.mobile;
}

T kRender<T>({
  required T Function() mobile,
  T Function()? tablet,
  T Function()? desktop,
}) {
  final screenType = ScreenLayout.instance.currentScreenType;

  if (screenType == ScreenType.desktop) {
    if (desktop != null) {
      return desktop();
    } else if (tablet != null) {
      return tablet();
    }
  } else if (screenType == ScreenType.tablet) {
    if (tablet != null) {
      return tablet();
    }
  }

  return mobile();
}

T kRenders<T>(
  List<Widget> components, {
  required T Function(List<Widget>) mobile,
  T Function(List<Widget>)? tablet,
  T Function(List<Widget>)? desktop,
}) {
  final screenType = ScreenLayout.instance.currentScreenType;

  if (screenType == ScreenType.desktop) {
    if (desktop != null) {
      return desktop(components);
    } else if (tablet != null) {
      return tablet(components);
    }
  } else if (screenType == ScreenType.tablet) {
    if (tablet != null) {
      return tablet(components);
    }
  }

  return mobile(components);
}

Widget kLayout(
  Widget basicLayout,
  Map<double, Widget> layouts,
) {
  return LayoutBuilder(
    builder: (context, constraints) {
      for (final layout in layouts.entries.toList().reversed) {
        if (layout.key <= constraints.maxWidth) {
          return layout.value;
        }
      }

      return basicLayout;
    },
  );
}

Widget kLayouts(
  List<Widget> components,
  Widget Function(List<Widget>) basicLayout,
  Map<double, Widget Function(List<Widget>)> layouts,
) {
  return LayoutBuilder(
    builder: (context, constraints) {
      for (final layout in layouts.entries.toList().reversed) {
        if (layout.key <= constraints.maxWidth) {
          return layout.value(components);
        }
      }

      return basicLayout(components);
    },
  );
}
