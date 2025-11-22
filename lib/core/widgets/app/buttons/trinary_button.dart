import 'package:flutter/material.dart';

import '../../../utils/app_button_styles.dart';
import '../app_button.dart';

//no background no hover effect
class TrinaryButton extends AppButton {
  final ButtonStyle? buttonStyle;

  const TrinaryButton({
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
    super.hoverColor = Colors.transparent,
    this.buttonStyle,
  });

  @override
  Widget build(BuildContext context) {
    final trinaryStyle = AppButtonStyles.trinaryStyle(context);

    return AppButton(
      onPressed: onPressed,
      width: width,
      height: height,
      isAnimated: isAnimated,
      constraints: constraints,
      duration: duration,
      alignment: alignment,
      padding: padding,
      tooltip: tooltip,
      borderRadius: borderRadius,
      curve: curve,
      hoverColor: hoverColor,
      onMouseEnter: onMouseEnter,
      onMouseExit: onMouseExit,
      onMouseHover: onMouseHover,
      style: style == null
          ? trinaryStyle.merge(style)
          : buttonStyle?.merge(trinaryStyle.merge(style)),
      child: child,
    );
  }
}
