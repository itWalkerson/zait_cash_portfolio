import 'dart:async';

import 'package:injectable/injectable.dart';

abstract class AppEvent {}

@singleton
class AppEventNotifier {
  final _controller = StreamController<AppEvent>.broadcast();

  Stream<AppEvent> get stream => _controller.stream;

  void notify(AppEvent event) {
    if (!_controller.isClosed) {
      _controller.add(event);
    }
  }

  void dispose() {
    _controller.close();
  }
}
