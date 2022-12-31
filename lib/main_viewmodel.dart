import 'package:empire_lrp_helper/Themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'intro_slider/intro_slider.dart';

class MainViewModel {
  static final MainViewModel _mainViewModel = MainViewModel._internal();

  factory MainViewModel() {
    return _mainViewModel;
  }

  MainViewModel._internal();

  void main(){

  }

  late Themes theme;
  late String imagePath;
  late bool hasSeenIntro;
  late MaterialColor colourTheme;

  Future setTheme() async {
    final prefs = await SharedPreferences.getInstance();
    String? _theme = prefs.getString("theme");

    if(_theme != null) {
      switch (_theme) {
        case ("wintermark"):
          {
            theme = Themes.wintermark;
            imagePath = "assets/runes/Evrom.png";
            colourTheme = EmpireThemes.wintermarkTheme;
          }
          break;
        case ("dawn"):
          {
            theme = Themes.dawn;
            imagePath = "assets/${_theme!}Logo.png";
            colourTheme = EmpireThemes.dawnTheme;
          }
          break;
        case ("navarr"):
          {
            theme = Themes.navarr;
            imagePath = "assets/runes/Feresh.png";
            colourTheme = EmpireThemes.navarrTheme;
          }
          break;
        case ("highGuard"):
          {
            theme = Themes.highGuard;
            imagePath = "assets/runes/Evrom.png";
            colourTheme = EmpireThemes.highGuardTheme;
          }
          break;
        case ("marches"):
          {
            theme = Themes.marches;
            imagePath = "assets/${_theme!}Logo.png";
            colourTheme = EmpireThemes.marchesTheme;
          }
          break;
        case ("brassCoast"):
          {
            theme = Themes.brassCoast;
            imagePath = "assets/${_theme!}Logo.png";
            colourTheme = EmpireThemes.brassCoastTheme;
          }
          break;
        case ("imperialOrcs"):
          {
            theme = Themes.imperialOrcs;
            imagePath = "assets/${_theme!}Logo.png";
            colourTheme = EmpireThemes.imperialOrcsTheme;
          }
          break;
        case ("league"):
          {
            theme = Themes.league;
            imagePath = "assets/${_theme!}Logo.png";
            colourTheme = EmpireThemes.leagueTheme;
          }
          break;
        case ("urizen"):
          {
            theme = Themes.urizen;
            imagePath = "assets/${_theme!}Logo.png";
            colourTheme = EmpireThemes.urizenTheme;
          }
          break;
        case ("varushka"):
          {
            theme = Themes.varushka;
            imagePath = "assets/${_theme!}Logo.png";
            colourTheme = EmpireThemes.varushkaTheme;
          }
          break;
        default:
          {
            theme = Themes.defaultTheme;
            imagePath = "assets/runes/Feresh.png";
            colourTheme = EmpireThemes.defaultTheme;
          }
      }
    } else {
      theme = Themes.defaultTheme;
      imagePath = "assets/runes/Feresh.png";
      colourTheme = EmpireThemes.defaultTheme;
    }
  }

  Future getHasSeenIntro() async {
    final prefs = await SharedPreferences.getInstance();
    if(prefs.getBool("hasSeenIntro") == null) {
      hasSeenIntro = false;
    } else {
      hasSeenIntro = prefs.getBool("hasSeenIntro")!;
    }
  }
}
