import 'app_event_notifier.dart';

class ReportUpdateEvent extends ReportEvent {}

class ReportAddEvent extends ReportEvent {}

class ReportDeleteEvent extends ReportEvent {}

abstract class ReportEvent extends AppEvent {}
