class Prefs {
  final int selectedTheme;

  Prefs({this.selectedTheme = 0});

  Prefs copyWith({int? selectedTheme}) => Prefs(selectedTheme: selectedTheme ?? this.selectedTheme);
}
