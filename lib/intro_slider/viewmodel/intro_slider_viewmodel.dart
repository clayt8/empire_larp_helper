import 'package:shared_preferences/shared_preferences.dart';
import '../intro_slider.dart';

class IntroSliderViewModel {

  Future<void> setTheme(Themes theme) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("theme", theme.name.toString());
    prefs.setBool("hasSeenIntro", true);
  }
}