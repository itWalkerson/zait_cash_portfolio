import 'package:flutter/material.dart';

@immutable
class AppStatusColors extends ThemeExtension<AppStatusColors> {
  final Color success;
  final Color warning;

  const AppStatusColors({required this.success, required this.warning});

  @override
  AppStatusColors copyWith({Color? success, Color? warning}) =>
      AppStatusColors(success: success ?? this.success, warning: warning ?? this.warning);

  @override
  AppStatusColors lerp(ThemeExtension<AppStatusColors>? other, double t) {
    if (other is! AppStatusColors) return this;
    return AppStatusColors(
      success: Color.lerp(success, other.success, t) ?? success,
      warning: Color.lerp(warning, other.warning, t) ?? warning,
    );
  }
}

extension AppStatusColorsAccess on ThemeData {
  AppStatusColors get status =>
      extension<AppStatusColors>() ?? const AppStatusColors(success: Colors.green, warning: Colors.orange);

  Color get success => status.success;
  Color get warning => status.warning;
}
