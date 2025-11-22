import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zait_cash_portfolio/features/shared/home/presentation/cubits/prefs_cubit.dart';

import '../di/dependency_injection.dart';
import '../events/app_event_cubit.dart';

class AppBlocProvider extends StatelessWidget {
  final Widget child;

  const AppBlocProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AppEventsCubit>()),
        BlocProvider(create: (context) => getIt<PrefsCubit>()),
      ],
      child: child,
    );
  }
}
