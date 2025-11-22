import 'package:flutter/material.dart';

import '../../../utils/app_button_styles.dart';
import '../app_button.dart';

//no background with border
class BorderButton extends AppButton {
  final ButtonStyle? buttonStyle;
  final double? borderWidth;

  const BorderButton({
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
    this.buttonStyle,
    this.borderWidth = 0.7,
  });

  @override
  Widget build(BuildContext context) {
    final borderStyle = AppButtonStyles.borderStyle(context, borderWidth: borderWidth);

    return AppButton(
      onPressed: onPressed,
      width: width,
      height: height,
      alignment: alignment,
      borderRadius: borderRadius,
      constraints: constraints,
      curve: curve,
      duration: duration,
      isAnimated: isAnimated,
      padding: padding,
      onMouseEnter: onMouseEnter,
      onMouseHover: onMouseHover,
      onMouseExit: onMouseExit,
      tooltip: tooltip,
      style: buttonStyle == null
          ? borderStyle.merge(style)
          : buttonStyle?.merge(borderStyle.merge(style)),
      child: child,
    );
  }
}
