import 'package:flutter/material.dart';

import '../extensions/build_context_extensions.dart';
import '../extensions/color_extensions.dart';
import 'constants.dart';

class AppButtonStyles {
  static primaryStyle(BuildContext context) => ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(context.theme.primaryColor),
    foregroundColor: WidgetStatePropertyAll(context.theme.colorScheme.surface),
    iconColor: WidgetStatePropertyAll(context.theme.colorScheme.surface),
    side: WidgetStatePropertyAll(BorderSide(color: context.theme.primaryColor.shade600)),
  );

  static borderStyle(BuildContext context, {double? borderWidth}) => ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(context.theme.scaffoldBackgroundColor),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius.outer),
        side: BorderSide(color: context.theme.dividerColor, width: borderWidth ?? 0.7),
      ),
    ),
  );

  static ghostStyle(BuildContext context, Color hoverColor) => ButtonStyle(
    backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
    overlayColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.hovered)) {
        return hoverColor;
      }
      return null;
    }),
  );

  static secondaryStyle(BuildContext context) => ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(context.theme.scaffoldBackgroundColor),
    side: WidgetStatePropertyAll(BorderSide(width: 1, color: context.theme.dividerColor)),
  );

  static subtleStyle(BuildContext context) => ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(
      context.theme.iconButtonTheme.style?.backgroundColor?.resolve({})?.withValues(alpha: 0),
    ),
  );

  static trinaryStyle(BuildContext context) => ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(context.theme.secondaryHeaderColor),
    foregroundColor: WidgetStatePropertyAll(context.theme.primaryColor),
  );

  static destructiveStyle(BuildContext context) => ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(Colors.red.withValues(alpha: 0.05)),
    foregroundColor: const WidgetStatePropertyAll(Colors.red),
    side: WidgetStatePropertyAll(BorderSide(color: Colors.red.withValues(alpha: 0.3), width: 0.7)),
  );
}
