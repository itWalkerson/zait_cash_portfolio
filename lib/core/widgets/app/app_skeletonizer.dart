import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../features/shared/home/presentation/cubits/prefs_cubit.dart';
import '../../../features/shared/home/presentation/cubits/prefs_states.dart';
import '../../extensions/build_context_extensions.dart';
import '../../extensions/color_extensions.dart';

class AppSkeletonizer extends StatelessWidget {
  final Widget child;
  final Color? containersColor;
  final Color? baseColor;
  final bool enabled;
  final bool? enableSwitchAnimation;

  const AppSkeletonizer({
    super.key,
    required this.child,
    this.containersColor,
    this.baseColor,
    this.enabled = false,
    this.enableSwitchAnimation = true,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrefsCubit, PrefsStates>(
      builder:
          (context, state) => Skeletonizer(
            enabled: enabled,
            enableSwitchAnimation: enableSwitchAnimation,
            containersColor: containersColor ?? context.theme.cardColor,
            effect: ShimmerEffect(
              // baseColor: baseColor ?? context.theme.disabledColor.withValues(alpha: 0.1),
              baseColor:
                  state is PrefsLoaded
                      ? (state.prefs.selectedTheme == 0
                          ? const Color(0xFFEBEBF4)
                          : const Color(0xFFEBEBF4).inverted)
                      : const Color(0xFFEBEBF4),
              highlightColor:
                  state is PrefsLoaded
                      ? (state.prefs.selectedTheme == 0
                          ? const Color(0xFFF4F4F4)
                          : const Color(0xFFE2E1E1).inverted)
                      : const Color(0xFFF4F4F4),
            ),
            child: child,
          ),
    );
  }
}
