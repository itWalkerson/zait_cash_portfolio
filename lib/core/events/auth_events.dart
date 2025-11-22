import 'app_event_notifier.dart';

class AuthLoginEvent extends AuthEvents {}

class AuthLogoutEvent extends AuthEvents {}

class AuthErrorEvent extends AuthEvents {}

abstract class AuthEvents extends AppEvent {}
