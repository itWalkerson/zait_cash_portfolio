import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/utils/logger.dart';
import '../../domain/models/prefs.dart';
import 'prefs_states.dart';

//todo will fix when class grows
@injectable
class PrefsCubit extends Cubit<PrefsStates> with LogLayerMixin {
  PrefsCubit() : super(PrefsInit()) {
    init();
  }

  Prefs? prefs;

  Future<void> init() async {
    logInfo(init);

    prefs = Prefs(selectedTheme: 0);
    emit(PrefsLoaded(prefs: prefs!));
  }

  void updateTheme(int newThemeIndex) =>
      emit(PrefsLoaded(prefs: Prefs(selectedTheme: newThemeIndex)));
}
