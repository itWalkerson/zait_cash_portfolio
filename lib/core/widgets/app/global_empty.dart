import 'package:amazing_icons/amazing_icons.dart';
import 'package:flutter/material.dart';

import '../../extensions/int_extensions.dart';
import '../../utils/constants.dart';
import 'app_text.dart';
import 'buttons/secondary_button.dart';

class GlobalEmpty extends StatelessWidget {
  final String? message;
  final VoidCallback? onRefresh;
  final double? iconSize;
  final String? refreshLabel;
  final IconData? icon;
  final bool? showRefresh;

  const GlobalEmpty({
    super.key,
    this.message = "No data available",
    this.onRefresh,
    this.iconSize,
    this.refreshLabel = "Refresh",
    this.icon,
    this.showRefresh = true,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: kGap.small,
        children: [
          Icon(icon ?? AmazingIconOutlined.note_2, size: iconSize ?? kIconSize.large),
          BodyLargeText(message ?? "No data available"),
          if (showRefresh == true)
            SecondaryButton(
              padding: kPadding.medium.pHori,
              onPressed: onRefresh ?? () {},
              child: BodyLargeText(refreshLabel ?? "Refresh"),
            ),
        ],
      ),
    );
  }
}
