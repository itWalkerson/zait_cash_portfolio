import 'package:flutter/material.dart';

import '../../../utils/app_button_styles.dart';
import '../app_button.dart';

//primary background
class PrimaryButton extends AppButton {
  final ButtonStyle? buttonStyle;

  const PrimaryButton({
    super.key,
    required super.child,
    super.onPressed,
    super.height,
    super.width,
    super.isAnimated,
    super.constraints,
    super.duration,
    super.alignment,
    super.padding,
    super.tooltip,
    super.borderRadius,
    super.curve,
    super.onMouseEnter,
    super.onMouseExit,
    super.onMouseHover,
    super.hoverColor,
    this.buttonStyle,
  });

  @override
  Widget build(BuildContext context) {
    final primaryStyle = AppButtonStyles.primaryStyle(context);

    return AppButton(
      onPressed: onPressed,
      height: height,
      width: width,
      isAnimated: isAnimated,
      padding: padding,
      alignment: alignment,
      constraints: constraints,
      curve: curve,
      duration: duration,
      tooltip: tooltip,
      borderRadius: borderRadius,
      onMouseEnter: onMouseEnter,
      onMouseExit: onMouseExit,
      onMouseHover: onMouseHover,
      hoverColor: hoverColor,
      style: buttonStyle == null ? primaryStyle.merge(style) : buttonStyle?.merge(primaryStyle.merge(style)),
      child: child,
    );
  }
}
