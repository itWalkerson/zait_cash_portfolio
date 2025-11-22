import 'package:flutter/material.dart';

import 'app_center.dart';
import 'app_fitted_box.dart';
import 'app_single_child_scrollview.dart';

class AppColumn extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final double spacing;
  final bool isScrollable;
  final bool isCentered;
  final bool isFitted;
  final BoxFit fit;
  final Alignment alignment;
  final EdgeInsetsGeometry padding;
  final ScrollPhysics? physics;
  final Axis scrollDirection;

  const AppColumn({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.min,
    this.spacing = 0.0,
    this.isScrollable = false,
    this.isCentered = false,
    this.isFitted = false,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.padding = EdgeInsets.zero,
    this.physics,
    this.scrollDirection = Axis.vertical,
  });

  @override
  Widget build(BuildContext context) {
    return AppSingleChildScrollView(
      enabled: isScrollable,
      physics: physics,
      scrollDirection: scrollDirection,
      child: AppCenter(
        enabled: isCentered,
        child: AppFittedBox(
          enabled: isFitted,
          fit: fit,
          child: Padding(
            padding: padding,
            child: Column(
              mainAxisAlignment: mainAxisAlignment,
              crossAxisAlignment: crossAxisAlignment,
              mainAxisSize: mainAxisSize,
              spacing: spacing,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
