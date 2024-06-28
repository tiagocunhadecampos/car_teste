import 'package:cars_teste/src/config/imports.dart';

enum ThemeType { light, dark }

class ThemeProvider with ChangeNotifier {
  late ThemeData _currentTheme;
  ThemeType _currentThemeType = ThemeType.light;

  ThemeProvider() {
    _initTheme();
  }

  Future<void> _initTheme() async {
    final isDarkTheme = SharedPreferencesManager.getTheme() ?? false;
    _currentThemeType = isDarkTheme ? ThemeType.dark : ThemeType.light;
    _currentTheme = _currentThemeType == ThemeType.light ? AppTheme.lightTheme : AppTheme.darkTheme;
  }

  ThemeData get currentTheme => _currentTheme;

  void toggleTheme() {
    _currentThemeType = _currentThemeType == ThemeType.light ? ThemeType.dark : ThemeType.light;
    _currentTheme = _currentThemeType == ThemeType.light ? AppTheme.lightTheme : AppTheme.darkTheme;
    SharedPreferencesManager.saveTheme(_currentThemeType == ThemeType.dark);
    notifyListeners();
  }

  bool get isDarkTheme => _currentThemeType == ThemeType.dark;
}
