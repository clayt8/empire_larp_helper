
import 'package:empire_lrp_helper/Screens/Home/home.dart';
import 'package:empire_lrp_helper/Screens/Runes/runes.dart';
import 'package:empire_lrp_helper/Screens/Settings/settings.dart';
import 'package:empire_lrp_helper/Themes/themes.dart';
import 'package:empire_lrp_helper/intro_slider/intro_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'drawer_helpers/my_header_drawer.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialization(null);
  FlutterNativeSplash.remove();

  runApp(const MyApp());
}

Future initialization(BuildContext? context) async {
  //load resources
  await Future.delayed(const Duration(milliseconds: 500));
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: EmpireThemes.dawnTheme,
      ),
      home: const IntroSliderScreen(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var currentPage = DrawerSelections.Home;

  @override
  Widget build(BuildContext context) {
    var container;
    if(currentPage == DrawerSelections.Home){
      container = const HomeScreen();
    }
    if(currentPage == DrawerSelections.Runes){
      container = const RunesScreen();
    }
    if(currentPage == DrawerSelections.Settings){
      container = const SettingsScreen();
    }

    return Scaffold(
      appBar: AppBar(title: Text(currentPage.name.toString())),
      body: Container(
        child: container,
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                myHeaderDrawer(),
                myDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget myDrawerList() {
    return Container(
      padding: const EdgeInsets.only(top: 25),
      child: Column(
        children: [
          menuItem(1, "Home", 'assets/dawnLogo.png',
              currentPage == DrawerSelections.Home ? true : false),
          menuItem(2, "Runes", 'assets/dawnLogo.png',
              currentPage == DrawerSelections.Runes ? true : false),
          menuItem(3, "Settings", 'assets/dawnLogo.png',
              currentPage == DrawerSelections.Settings ? true : false)
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, String icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if(id == 1) {
              currentPage = DrawerSelections.Home;
            }
            if(id == 2) {
              currentPage = DrawerSelections.Runes;
            }
            if(id == 3) {
              currentPage = DrawerSelections.Settings;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Image.asset(
                icon,
                height: 40.0,
                fit: BoxFit.cover,
              ),
              Expanded(
                  flex: 3,
                  child: Text(title,
                      style: const TextStyle(
                          color: Colors.black, fontSize: 16)))
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSelections {
  Home,
  Runes,
  Spellbook,
  Alchemy,
  Forging,
  Settings,
}