import 'package:flutter/material.dart';

import 'app_center.dart';
import 'app_fitted_box.dart';

class AppRow extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final double spacing;
  final bool isCentered;
  final bool isFitted;
  final BoxFit fit;
  final Alignment alignment;
  final EdgeInsetsGeometry padding;
  final bool enabled;

  const AppRow({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.min,
    this.spacing = 0.0,
    this.isCentered = false,
    this.isFitted = false,
    this.enabled = true,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return AppCenter(
      enabled: isCentered,
      child: AppFittedBox(
        enabled: isFitted,
        alignment: alignment,
        fit: fit,
        child: Padding(
          padding: padding,
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            spacing: spacing,
            children: children,
          ),
        ),
      ),
    );
  }
}
