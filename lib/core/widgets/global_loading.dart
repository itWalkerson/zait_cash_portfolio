import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../extensions/build_context_extensions.dart';
import '../extensions/double_extensions.dart';
import '../utils/constants.dart';
import 'app/app_text.dart';

class GlobalLoading extends StatelessWidget {
  final double? width;
  final double? height;
  final double? maxWidth;
  final double? minWidth;
  final double? minHeight;
  final double? maxHeight;
  final AlignmentGeometry? alignment;
  final bool surface;

  const GlobalLoading({
    super.key,
    this.width = 20,
    this.height = 20,
    this.maxHeight,
    this.minHeight,
    this.maxWidth,
    this.minWidth,
    this.alignment = Alignment.center,
    this.surface = false,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? double.infinity,
        maxHeight: maxHeight ?? double.infinity,
        minHeight: minHeight ?? 0,
        minWidth: minWidth ?? 0,
      ),
      child: AnimatedAlign(
        duration: const Duration(milliseconds: 300),
        alignment: alignment!,
        child: SizedBox(
          width: width,
          height: height,
          child: CircularProgressIndicator(
            color: surface ? context.theme.colorScheme.surface : context.theme.iconTheme.color,
          ),
        ),
      ),
    );
  }
}

class GlobalLoadingWave extends StatelessWidget {
  final String? label;
  final double width;
  final double height;
  final Color? color;
  final BlendMode blendMode;
  final double? spacing;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const GlobalLoadingWave({
    super.key,
    this.width = 60,
    this.height = 60,
    this.spacing,
    this.color,
    this.label,
    this.blendMode = BlendMode.srcATop,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        // spacing: label == null ? 0 : (spacing ?? kGap.big),
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(color ?? context.theme.primaryColor, blendMode),
            child: Lottie.asset('assets/animations/wave.json', width: width, height: height),
          ),

          if (label != null) (spacing ?? kGap.big).height,

          if (label != null) TitleMediumText(label!),
        ],
      ),
    );
  }
}
