class ThemeSwitcher {
  theme curTheme;

  ThemeSwitcher({required this.curTheme});

  void toggleTheme() {
    print("Hi");
    if (curTheme == theme.dark) {
      curTheme = theme.light;
    } else {
      curTheme = theme.dark;
    }
  }
}

enum theme {
  dark,
  light,
}
