import 'package:flutter/material.dart';

import '../extensions/color_extensions.dart';

class GColors {
  static const Color background = Color(0xFFffffff);
  static const Color surface = Color(0xFFf5f6f8);
  static const Color border = Color(0xFFdfdfdf);
  static const Color font = Color(0xFF21252c);
  static const Color accent = Color(0xff034a08f);
  static const Color darkAccent = Color(0xff034a08f);
  static const Color disabled = Color(0xFFf5f6f8);

  // Light theme colors
  static const Color red = Color(0xFFd13438); //error
  static const Color brown = Color(0xFF9d5d00); //warning
  static const Color green = Color(0xFF0f7b0f); //success
  static const Color craterBrown = Color(0xFF442726); //toast error background
  static const Color lightYellow = Color(0xFFfff4ce); //toast warning background
  static const Color lightGreen = Color(0xFFdff6dd); //toast success background
  static const Color cinderella = Color(0xFFfde7e9); //toast error background

  // Dark theme colors
  static const Color darkBackground = Color(0xFF202020); // Dark background
  static const Color darkSurface = Color(0xFF2c2c2c); // Dark surface/container
  static const Color darkAppbar = Color(0xFF1c1c1c); // Darker appbar
  static const Color darkBorder = Color(0xFF3c3c3c); // Dark border
  static const Color darkDivider = Color(0xFF404040); // Dark divider
  static const Color darkText = Color(0xFFffffff); // White text
  static const Color darkIcon = Color(0xFFffffff); // White icons
  static const Color darkDisabled = Color(0xFF6d6d6d); // Dark disabled
  static const Color darkBlue = Color(0xFF60cdff); // Windows 11 accent blue
  static const Color darkRed = Color(0xFFff9999); // error
  static const Color yellow = Color(0xFFfce100); //warning
  static const Color mantis = Color(0xFF6ccb5f); //success
  static const Color darkHover = Color(0xFF404040); // Dark hover state
  static const Color darkYellow = Color(0xFF433519); //toast warning background
  static const Color darkGreen = Color(0xFF393d1b); //toast success background

  static GlobalColorsManager getColors({
    required int themeIndex,
    required int accentColorIndex,
    required bool useSystemAccentColor,
  }) {
    switch (themeIndex) {
      case 1:
        return GlobalColorsManager(
          background: darkBackground,
          appbar: darkAppbar,
          dialog: darkSurface,
          container: darkSurface,
          iconButton: darkSurface,
          textField: darkSurface,
          textButton: darkSurface,
          indicator: darkSurface.darken(0.02),
          border: darkBorder,
          divider: darkDivider,
          disabled: darkDisabled,
          shadow: darkSurface.darken(0.06),
          icon: darkIcon,
          text: darkText,
          error: darkRed,
          warning: yellow,
          success: mantis,
          primary: darkAccent,
          secondary: darkAccent.withValues(alpha: 0.3),
          hover: darkHover,
          focus: darkText.withValues(alpha: 0.03),
          splash: darkText.withValues(alpha: 0.05),
          highlight: darkText.withValues(alpha: 0.04),
          toastError: craterBrown,
          toastWarning: darkYellow,
          toastSuccess: darkGreen,
          hint: darkText.shade700,
        );
      default:
        return GlobalColorsManager(
          background: background,
          appbar: background,
          dialog: background,
          container: surface,
          iconButton: surface,
          textField: surface,
          textButton: surface,
          indicator: surface.darken(0.02),
          border: border,
          divider: border,
          disabled: disabled,
          icon: font,
          text: Colors.black,
          shadow: font,
          focus: font.withValues(alpha: 0.03),
          splash: font.withValues(alpha: 0.05),
          highlight: font.withValues(alpha: 0.04),
          hover: font.withValues(alpha: 0.03),
          primary: accent,
          secondary: accent.withValues(alpha: 0.3),
          error: red,
          warning: brown,
          success: green,
          toastError: cinderella,
          toastWarning: lightYellow,
          toastSuccess: lightGreen,
        );
    }
  }
}

class GlobalColorsManager {
  final Color background;
  final Color appbar;
  final Color container;
  final Color divider;
  final Color border;
  final Color text;
  final Color icon;
  final Color dialog;
  final Color disabled;
  final Color primary;
  final Color indicator;
  final Color secondary;
  final Color textButton;
  final Color iconButton;
  final Color textField;
  final Color error;
  final Color warning;
  final Color success;
  final Color hover;
  final Color focus;
  final Color shadow;
  final Color splash;
  final Color highlight;
  final Color toastSuccess;
  final Color toastWarning;
  final Color toastError;
  final Color? hint;

  const GlobalColorsManager({
    required this.background,
    required this.appbar,
    required this.container,
    required this.divider,
    required this.border,
    required this.text,
    required this.indicator,
    required this.icon,
    required this.dialog,
    required this.disabled,
    required this.primary,
    required this.secondary,
    required this.textButton,
    required this.iconButton,
    required this.textField,
    required this.error,
    required this.warning,
    required this.success,
    required this.hover,
    required this.focus,
    required this.shadow,
    required this.splash,
    required this.highlight,
    required this.toastSuccess,
    required this.toastWarning,
    required this.toastError,
    this.hint,
  });
}
