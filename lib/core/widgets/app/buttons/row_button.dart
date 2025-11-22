import 'package:flutter/material.dart';

import '../../../extensions/build_context_extensions.dart';
import '../../../extensions/int_extensions.dart';
import '../../../utils/constants.dart';
import '../app_container.dart';
import '../app_fitted_box.dart';
import '../app_row.dart';
import '../app_text.dart';
import 'primary_button.dart';
import 'trinary_button.dart';

class RowButton extends StatelessWidget {
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

  const RowButton({
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
          spacing: kGap.small,
          children: [
            TrinaryButton(
              child: Icon(icon, size: iconSize ?? kIconSize.small, color: context.theme.primaryColor),
            ),
            LabelLargeText(label),
            const Spacer(),
            PrimaryButton(
              onPressed: onPressed,
              child: Icon(Icons.arrow_forward_ios_rounded, size: iconSize ?? kIconSize.small),
            ),
          ],
        ),
      ),
    );
  }
}
