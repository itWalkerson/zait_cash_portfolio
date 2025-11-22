import 'package:flutter/material.dart';

import '../../extensions/build_context_extensions.dart';
import '../../extensions/double_extensions.dart';
import '../../extensions/int_extensions.dart';
import '../../utils/constants.dart';
import 'app_container.dart';
import 'app_fitted_box.dart';
import 'app_row.dart';
import 'app_text.dart';
import 'buttons/trinary_button.dart';

class AppInformationRow extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final double? borderWidth;
  final double? iconSize;
  final EdgeInsets? padding;
  final Color? color;
  final bool isFitted;
  final Alignment alignment;
  final List<Widget> extras;

  const AppInformationRow({
    super.key,
    required this.label,
    required this.icon,
    this.onPressed,
    this.width,
    this.height,
    this.iconSize,
    this.padding,
    this.borderWidth,
    this.color,
    this.isFitted = true,
    this.alignment = Alignment.centerLeft,
    this.extras = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      onTap: onPressed,
      padding: padding ?? kPadding.small.pAll,
      borderWidth: borderWidth ?? 0,
      width: width,
      height: height,
      color: color,
      child: AppFittedBox(
        alignment: alignment,
        enabled: isFitted,
        child: AppRow(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: kGap.small,
              children: [
                TrinaryButton(
                  width: 30,
                  height: 30,
                  child: Icon(icon, size: iconSize ?? kIconSize.small, color: context.theme.primaryColor),
                ),
                LabelLargeText(label),
              ],
            ),
            kGap.small.width,

            // AppRow(children: extras),
            ...extras,
          ],
        ),
      ),
    );
  }
}
