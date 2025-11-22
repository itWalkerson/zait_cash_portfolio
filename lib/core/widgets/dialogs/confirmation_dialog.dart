import 'package:flutter/material.dart';

import '../../extensions/build_context_extensions.dart';
import '../../extensions/int_extensions.dart';
import '../../utils/app_button_styles.dart';
import '../../utils/constants.dart';
import '../app/app_button.dart';
import '../app/app_container.dart';
import '../app/app_text.dart';
import '../app/buttons/subtle_button.dart';

class ConfirmationDialog extends StatelessWidget {
  final String? title;
  final bool? bottomSpacing;
  final void Function()? onSavePressed;
  final void Function()? onCancelPressed;
  final bool showSaveButton;
  final bool showCancelButton;
  final ButtonStyle? saveButtonStyle;
  final ButtonStyle? cancelButtonStyle;
  final AppTextConfiguration? saveTextConfiguration;
  final AppTextConfiguration? cancelTextConfiguration;
  final String saveLabel;
  final String cancelLabel;
  final bool switchButtons;

  //title bar
  final List<Widget> topbarChildren;
  final MainAxisAlignment topbarMainAxisAlignment;
  final CrossAxisAlignment topbarCrossAxisAlignment;
  final MainAxisSize topbarMainAxisSize;
  final double topbarSpacing;
  final bool topbarIconAlignLeft;

  //content
  final List<Widget> contentChildren;
  final MainAxisAlignment contentMainAxisAlignment;
  final CrossAxisAlignment contentCrossAxisAlignment;
  final MainAxisSize contentMainAxisSize;
  final double contentSpacing;

  const ConfirmationDialog({
    super.key,
    this.title,
    this.onSavePressed,
    this.onCancelPressed,
    this.topbarChildren = const [],
    this.topbarMainAxisAlignment = MainAxisAlignment.start,
    this.topbarCrossAxisAlignment = CrossAxisAlignment.center,
    this.topbarMainAxisSize = MainAxisSize.max,
    this.topbarSpacing = 0,
    this.topbarIconAlignLeft = false,
    this.switchButtons = false,
    this.contentChildren = const [],
    this.contentMainAxisAlignment = MainAxisAlignment.center,
    this.contentCrossAxisAlignment = CrossAxisAlignment.center,
    this.contentMainAxisSize = MainAxisSize.min,
    this.contentSpacing = 20,
    this.bottomSpacing = false,
    this.showSaveButton = true,
    this.showCancelButton = true,
    this.saveButtonStyle,
    this.cancelButtonStyle,
    this.saveTextConfiguration,
    this.cancelTextConfiguration,
    this.cancelLabel = 'Cancel',
    this.saveLabel = 'Save',
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.theme.cardColor,
      contentPadding: 0.pAll,
      actionsAlignment: MainAxisAlignment.end,
      content: AppContainer(
        padding: kPadding.medium.pAll,
        color: context.theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(kBorderRadius.outer),
          topRight: Radius.circular(kBorderRadius.outer),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: contentMainAxisAlignment,
            crossAxisAlignment: contentCrossAxisAlignment,
            mainAxisSize: contentMainAxisSize,
            spacing: contentSpacing,
            children: [
              //title
              Row(
                mainAxisAlignment: topbarMainAxisAlignment,
                crossAxisAlignment: topbarCrossAxisAlignment,
                mainAxisSize: topbarMainAxisSize,
                spacing: topbarSpacing,
                children: topbarIconAlignLeft
                    ? [...topbarChildren, H3(title ?? 'Title:')]
                    : [H3(title ?? 'Title:'), ...topbarChildren],
              ),

              //main children
              ...contentChildren,

              bottomSpacing! ? 20.height : 0.height,
            ],
          ),
        ),
      ),

      //save, cancel buttons
      actions: switchButtons ? _buildActions(context).reversed.toList() : _buildActions(context),
    );
  }

  List<AppButton> _buildActions(BuildContext context) {
    return [
      if (showSaveButton)
        SubtleButton(
          onPressed: onSavePressed,
          width: kDialogButton.width,
          height: kDialogButton.height,
          buttonStyle: saveButtonStyle ?? AppButtonStyles.subtleStyle(context),
          child: BodySmallText(saveLabel, config: saveTextConfiguration),
        ),
      if (showCancelButton)
        SubtleButton(
          onPressed: onCancelPressed ?? () => context.pop(),
          width: kDialogButton.width,
          height: kDialogButton.height,
          buttonStyle: cancelButtonStyle ?? AppButtonStyles.primaryStyle(context),
          child: BodySmallText(
            cancelLabel,
            config: cancelTextConfiguration ?? const AppTextConfiguration(surface: true),
          ),
        ),
    ];
  }
}
