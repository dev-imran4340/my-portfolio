import 'package:flutter/widgets.dart';

abstract final class Breakpoints {
  static const mobile = 600.0;
  static const tablet = 768.0;
  static const laptop = 992.0;
  static const desktop = 1200.0;
  static const wide = 1440.0;
}

extension ResponsiveContext on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;

  bool get isMobile => screenWidth < Breakpoints.tablet;
  bool get isTablet =>
      screenWidth >= Breakpoints.tablet && screenWidth < Breakpoints.desktop;
  bool get isDesktop => screenWidth >= Breakpoints.desktop;
  bool get isCompact => screenWidth < Breakpoints.laptop;

  T responsive<T>({
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop) return desktop ?? tablet ?? mobile;
    if (isTablet) return tablet ?? mobile;
    return mobile;
  }

  double get pagePadding => responsive(mobile: 20, tablet: 32, desktop: 40);

  double get sectionPadding =>
      responsive(mobile: 72, tablet: 88, desktop: 112);
}
