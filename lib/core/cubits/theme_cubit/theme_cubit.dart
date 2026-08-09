import 'package:bloc/bloc.dart';
import 'package:fruitify/constants.dart';
import 'package:fruitify/core/services/shared_preferences_singleton.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(isDarkMode: false)) {
    _loadThemFromPrefs();
  }

  void toggleTheme() {
    final newIsDarkMode = !state.isDarkMode;
    emit(ThemeState(isDarkMode: newIsDarkMode));
    prehs.setbool(kIsDarkMode, newIsDarkMode);
  }

  void _loadThemFromPrefs() {
    final isDarkMode = prehs.getbool(kIsDarkMode);
    emit(ThemeState(isDarkMode: isDarkMode));
  }
}
