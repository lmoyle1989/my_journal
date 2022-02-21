class Settings {
  bool darkMode;

  Settings({required this.darkMode});

  void toggleDarkMode() {
    if (darkMode) {
      darkMode = false;
    } else {
      darkMode = true;
    }
  }
}
