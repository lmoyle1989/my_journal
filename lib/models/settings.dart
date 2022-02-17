class Settings {
  theme currentTheme;

  Settings({required this.currentTheme});

  void toggleTheme() {
    if (currentTheme == theme.dark) {
      currentTheme = theme.light;
    } else {
      currentTheme = theme.dark;
    }
  }
}

enum theme {
  dark,
  light,
}
