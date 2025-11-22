import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

import '../core/bloc/bloc_provider.dart';
import '../core/theme/app_theme.dart';
import '../features/shared/home/presentation/cubits/prefs_cubit.dart';
import '../features/shared/home/presentation/cubits/prefs_states.dart';
import '../features/shared/home/presentation/pages/home_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  ThemeData? currentTheme;

  @override
  void initState() {
    super.initState();

    currentTheme = getAppTheme(themeIndex: 0, accentColorIndex: 0, opacity: 1, useSystemAccentColor: false);
  }

  @override
  Widget build(BuildContext context) {
    return AppBlocProvider(
      child: BlocConsumer<PrefsCubit, PrefsStates>(
        listener: (context, prefsState) {
          if (prefsState is PrefsLoaded) {
            final prefs = prefsState.prefs;

            currentTheme = getAppTheme(
              themeIndex: prefs.selectedTheme,
              accentColorIndex: 0,
              opacity: 1,
              useSystemAccentColor: false,
            );
          }
        },
        builder:
            (context, state) => ToastificationWrapper(
              config: const ToastificationConfig(maxToastLimit: 2),
              child: MaterialApp(debugShowCheckedModeBanner: false, theme: currentTheme, home: const HomePage()),
            ),
      ),
    );
  }
}
