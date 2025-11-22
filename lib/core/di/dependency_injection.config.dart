// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:zait_cash_portfolio/core/events/app_event_cubit.dart' as _i505;
import 'package:zait_cash_portfolio/core/events/app_event_notifier.dart'
    as _i845;
import 'package:zait_cash_portfolio/core/modules/supabase_module.dart'
    as _i1039;
import 'package:zait_cash_portfolio/features/shared/home/presentation/cubits/prefs_cubit.dart'
    as _i874;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i874.PrefsCubit>(() => _i874.PrefsCubit());
    gh.singleton<_i505.AppEventsCubit>(() => _i505.AppEventsCubit());
    gh.singleton<_i845.AppEventNotifier>(() => _i845.AppEventNotifier());
    gh.lazySingleton<_i1039.SupabaseModule>(() => _i1039.SupabaseModule());
    return this;
  }
}
