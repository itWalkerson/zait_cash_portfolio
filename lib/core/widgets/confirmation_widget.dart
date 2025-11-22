import 'dart:ui';

import 'package:flutter/material.dart';

import '../extensions/build_context_extensions.dart';
import '../extensions/int_extensions.dart';
import '../utils/constants.dart';
import 'app/app_container.dart';
import 'app/app_row.dart';
import 'app/app_text.dart';
import 'app/buttons/primary_button.dart';
import 'app/buttons/subtle_button.dart';

class ConfirmationWidget extends StatelessWidget {
  final String? title;
  final Widget? titleWidget;
  final List<Widget> contentChildren;
  final void Function()? onSavePressed;
  final void Function()? onCancelPressed;
  final String saveButtonText;
  final String cancelButtonText;
  final double width;
  final EdgeInsets? padding;
  final bool showBackdropFilter;
  final Color? backgroundColor;
  final MainAxisSize contentMainAxisSize;
  final MainAxisAlignment contentMainAxisAlignment;
  final CrossAxisAlignment contentCrossAlignment;
  final double spacing;
  final Size? saveButtonSize;
  final Size? cancelButtonSize;

  const ConfirmationWidget({
    super.key,
    this.title,
    this.titleWidget,
    required this.contentChildren,
    this.onSavePressed,
    this.onCancelPressed,
    this.saveButtonText = 'Save',
    this.cancelButtonText = 'Cancel',
    this.width = 600,
    this.padding,
    this.showBackdropFilter = true,
    this.backgroundColor,
    this.contentMainAxisSize = MainAxisSize.min,
    this.contentMainAxisAlignment = MainAxisAlignment.center,
    this.contentCrossAlignment = CrossAxisAlignment.start,
    this.spacing = 20,
    this.saveButtonSize,
    this.cancelButtonSize,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: AppContainer(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: spacing,
          children: [
            AppContainer(
              color: backgroundColor ?? context.theme.scaffoldBackgroundColor,
              padding: padding ?? kPadding.medium.pAll,
              borderRadius: BorderRadius.circular(0),
              child: Column(
                spacing: spacing,
                crossAxisAlignment: contentCrossAlignment,
                mainAxisSize: contentMainAxisSize,
                mainAxisAlignment: contentMainAxisAlignment,
                children: [
                  if (titleWidget != null) titleWidget! else if (title != null) H3(title!),
                  ...contentChildren,
                ],
              ),
            ),
            AppRow(
              mainAxisAlignment: MainAxisAlignment.end,
              padding: kPadding.small.pHori,
              spacing: kGap.medium,
              children: [
                SubtleButton(
                  onPressed: onSavePressed,
                  width: saveButtonSize?.width ?? (kDialogButton.width + 10),
                  height: saveButtonSize?.height ?? (kDialogButton.height + 10),
                  child: BodyMediumText(saveButtonText),
                ),
                PrimaryButton(
                  onPressed: onCancelPressed ?? () => context.pop(),
                  width: cancelButtonSize?.width ?? (kDialogButton.width + 10),
                  height: cancelButtonSize?.height ?? (kDialogButton.height + 10),
                  child: BodyMediumText(
                    cancelButtonText,
                    config: const AppTextConfiguration(surface: true),
                  ),
                ),
              ],
            ),
            0.height,
          ],
        ),
      ),
    );

    if (showBackdropFilter) {
      content = BackdropFilter(filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), child: content);
    }

    return content;
  }
}
