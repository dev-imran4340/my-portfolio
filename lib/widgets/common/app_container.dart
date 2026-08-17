import 'package:flutter/material.dart';

import '../../app/theme/app_spacing.dart';
import '../../core/responsive/breakpoints.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    super.key,
    required this.child,
    this.maxWidth = AppSpacing.maxWidth,
  });

  final Widget child;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.pagePadding),
          child: child,
        ),
      ),
    );
  }
}

class SectionScaffold extends StatelessWidget {
  const SectionScaffold({
    super.key,
    required this.sectionKey,
    required this.child,
    this.background,
    this.semanticLabel,
  });

  final Key sectionKey;
  final Widget child;
  final Color? background;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding: EdgeInsets.symmetric(vertical: context.sectionPadding),
      child: AppContainer(child: child),
    );

    return ColoredBox(
      key: sectionKey,
      color: background ?? Colors.transparent,
      child: semanticLabel == null
          ? content
          : Semantics(header: false, label: semanticLabel, child: content),
    );
  }
}
