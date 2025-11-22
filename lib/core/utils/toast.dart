import 'package:amazing_icons/amazing_icons.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../extensions/color_extensions.dart';
import '../extensions/int_extensions.dart';
import '../theme/global_colors.dart';
import '../widgets/app/app_text.dart';
import '../widgets/app/buttons/subtle_button.dart';
import 'constants.dart';
import 'logger.dart';

class Toast with LogStaticMixin {
  static Opacity animationBuilder(Animation<double> animation, Widget child) =>
      Opacity(opacity: animation.value, child: child);

  static GlobalColorsManager colors = GColors.getColors(
    themeIndex: kPrefsInit.theme,
    accentColorIndex: kPrefsInit.selectedAccentColor,
    useSystemAccentColor: kPrefsInit.useSystemAccentColor,
  );

  static int themeIndex = kPrefsInit.theme;

  static void info(String title, [String? description]) => _show(
    title: title,
    description: description,
    textColor: themeIndex == 0 ? Colors.black : Colors.white,
    backgroundColor: colors.container.shade600,
    icon: AmazingIconOutlined.info_circle,
    iconColor: colors.icon,
  );

  static void warning(String title, [String? description]) => _show(
    title: title,
    description: description,
    iconColor: colors.warning,
    textColor: themeIndex == 0 ? Colors.black : Colors.white,
    borderColor: colors.warning,
    backgroundColor: colors.toastWarning,
    icon: AmazingIconOutlined.warning_2,
  );

  static void error(String title, [String? description]) => _show(
    title: title,
    description: description,
    backgroundColor: colors.toastError,
    iconColor: colors.error,
    textColor: themeIndex == 0 ? Colors.black : Colors.white,
    borderColor: colors.error,
    icon: AmazingIconOutlined.close_circle,
  );

  static void success(String title, [String? description]) => _show(
    title: title,
    description: description,
    backgroundColor: colors.toastSuccess,
    iconColor: colors.success,
    textColor: themeIndex == 0 ? Colors.black : Colors.white,
    borderColor: colors.success,
    icon: AmazingIconOutlined.tick_circle,
  );

  static void _show({
    required String title,
    required String? description,
    required Color backgroundColor,
    Color? iconColor,
    Color? textColor,
    Color? borderColor,
    IconData? icon,
    ToastificationStyle? style,
  }) {
    try {
      toastification.show(
        title: title.toLabelMedium(AppTextConfiguration(color: textColor)),
        description: description?.toLabelSmall(
          AppTextConfiguration(color: textColor, fontWeight: FontWeight.normal),
        ),
        backgroundColor: backgroundColor,
        primaryColor: colors.primary,
        style: style ?? ToastificationStyle.flat,
        dismissDirection: DismissDirection.down,
        alignment: Alignment.bottomCenter,
        padding: kPadding.medium.pHori,
        // ignore: deprecated_member_use
        closeButtonShowType: CloseButtonShowType.onHover,
        autoCloseDuration: 3.seconds,
        animationDuration: kDuration.medium,
        borderRadius: BorderRadius.circular(kBorderRadius.outer),
        borderSide: borderColor != null
            ? BorderSide.none
            : BorderSide(color: colors.divider, width: kBorderWidth.normal),
        applyBlurEffect: false,
        closeOnClick: true,
        dragToClose: true,
        showProgressBar: true,
        progressBarTheme: ProgressIndicatorThemeData(
          color: textColor,
          borderRadius: BorderRadius.circular(kBorderRadius.outer),
          linearTrackColor: colors.background,
          linearMinHeight: 1,
        ),
        icon: Icon(
          icon ?? AmazingIconOutlined.info_circle,
          color: iconColor,
          size: kIconSize.small,
        ),
        closeButton: ToastCloseButton(
          buttonBuilder: (context, onClose) => SubtleButton(
            width: kToastButton.width,
            height: kToastButton.height,
            onPressed: onClose,
            child: Icon(
              AmazingIconOutlined.close_circle,
              color: colors.icon,
              size: kIconSize.small,
            ),
          ),
        ),
        animationBuilder: (context, animation, alignment, child) =>
            animationBuilder(animation, child),
      );
    } catch (e) {
      LogStaticMixin.logWarning(
        'Toast failed, it is possible that something else failed before the initialization of the widget',
      );
    }
  }
}
