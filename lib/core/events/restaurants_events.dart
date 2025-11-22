import 'app_event_notifier.dart';

class RestaurantUpdateEvent extends RestaurantEvent {}

class RestaurantAddEvent extends RestaurantEvent {}

class RestaurantDeleteEvent extends RestaurantEvent {}

abstract class RestaurantEvent extends AppEvent {}
