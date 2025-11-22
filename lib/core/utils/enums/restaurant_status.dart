enum RestaurantStatus { active, inactive, paused, closed }

extension RestaurantStatusExtention on RestaurantStatus {
  String get value => name;
  static RestaurantStatus from(String s) =>
      RestaurantStatus.values.firstWhere((e) => e.name == s, orElse: () => RestaurantStatus.active);
}
