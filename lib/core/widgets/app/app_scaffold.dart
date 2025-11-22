import 'package:flutter/material.dart';

import '../../extensions/build_context_extensions.dart';
import '../../utils/constants.dart';
import 'app_container.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final Widget? bottomNavigationBar;
  final PreferredSizeWidget? appBar;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  const AppScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(kBorderRadius.none),
      borderWidth: 0,
      child: Scaffold(
        appBar: appBar,
        backgroundColor: backgroundColor ?? context.theme.scaffoldBackgroundColor,
        body: Padding(padding: padding ?? const EdgeInsets.all(0), child: body),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
