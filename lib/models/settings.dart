class Settings {
  bool darkMode;

  Settings({required this.darkMode});

  void toggleThemeValue() {
    if (darkMode) {
      darkMode = false;
    } else {
      darkMode = true;
    }
  }
}
