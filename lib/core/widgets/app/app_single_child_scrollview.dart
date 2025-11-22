import 'package:flutter/material.dart';

import '../horizontal_scroll_behavior.dart';

class AppSingleChildScrollView extends StatelessWidget {
  final Widget child;
  final Axis scrollDirection;
  final ScrollPhysics? physics;
  final bool enabled;
  final EdgeInsetsGeometry? padding;

  const AppSingleChildScrollView({
    super.key,
    required this.child,
    this.scrollDirection = Axis.vertical,
    this.physics = const BouncingScrollPhysics(),
    this.enabled = true,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return enabled
        ? ScrollConfiguration(
            behavior: HorizontalScrollBehavior(),
            child: SingleChildScrollView(
              scrollDirection: scrollDirection,
              physics: physics,
              padding: padding,
              child: child,
            ),
          )
        : child;
  }
}
