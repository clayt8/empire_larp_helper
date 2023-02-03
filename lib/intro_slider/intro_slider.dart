import 'package:empire_lrp_helper/intro_slider/viewmodel/intro_slider_viewmodel.dart';
import 'package:empire_lrp_helper/main_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intro_slider/intro_slider.dart';

import '../main.dart';

class IntroSliderScreen extends StatefulWidget {
  const IntroSliderScreen({Key? key}) : super(key: key);

  @override
  State<IntroSliderScreen> createState() => _IntroSliderScreenState();
}

class _IntroSliderScreenState extends State<IntroSliderScreen> {
  late IntroSliderViewModel viewModel;
  bool wintermarkSelected = false;
  bool dawnSelected = false;
  List<ContentConfig> listContentConfig = [];

  @override
  void initState() {
    super.initState();

    viewModel = IntroSliderViewModel();

    listContentConfig.add(
      const ContentConfig(
        title: "Welcome!",
        description:
            "Welcome and thank you for supporting the un-official Empire Larp helper app",
        pathImage: "assets/runes/Evrom.png",
        backgroundColor: Color(0xff881A72),
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        title: "An app for you!",
        description:
            "I hope this app is to your liking, its goal is to be a quick cheat sheet and study guide, I also take feature requests, contact me at Clayton.roberts@live.com",
        pathImage: "assets/runes/Irremais.png",
        backgroundColor: Color(0xff881A72),
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        title: "Choose your Style!",
        description:
            "Show your Empire Pride! choose what style you would like your app to take! (this can be changed at any time in the settings)",
        pathImage: "assets/runes/Feresh.png",
        backgroundColor: Color(0xff881A72),
      ),
    );

    listContentConfig.add(
      ContentConfig(
        title: "Choose your Style!",
        description:
            "Show your Empire Pride! choose what style you would like your app to take! (this can be changed at any time in the settings)",
        pathImage: "assets/runes/Feresh.png",
        backgroundColor: const Color(0xff881A72),
        centerWidget: themeButtons(),
        onCenterItemPress: () {},
      ),
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = [];
    for (int i = 0; i < listContentConfig.length; i++) {
      ContentConfig currentSlide = listContentConfig[i];
      if (currentSlide.centerWidget == null) {
        tabs.add(
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Container(
              padding: const EdgeInsets.only(bottom: 160, top: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(40),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Image.asset(
                      currentSlide.pathImage!,
                      matchTextDirection: true,
                      fit: BoxFit.fill,
                      height: 120,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    margin: const EdgeInsets.only(top: 20),
                    child: Text(
                      currentSlide.title!,
                      style: const TextStyle(
                          color: Colors.white, fontSize: 22, height: 1.5),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
                    child: Text(
                      currentSlide.description!,
                      maxLines: 5,
                      style: const TextStyle(
                          color: Colors.white, fontSize: 16, height: 1.5),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        tabs.add(
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Container(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Image.asset(
                      currentSlide.pathImage!,
                      matchTextDirection: true,
                      fit: BoxFit.fill,
                      height: 60,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    margin: const EdgeInsets.only(top: 20),
                    child: Text(
                      currentSlide.title!,
                      style: const TextStyle(
                          color: Colors.white, fontSize: 22, height: 1.5),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
                    child: currentSlide.centerWidget,
                  )
                ],
              ),
            ),
          ),
        );
      }
    }
    return tabs;
  }

  Widget themeButtons() {
    return InkWell(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(right: 8),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xff881A72),
                        side: const BorderSide(color: Colors.white, width: 3),
                      ),
                      onPressed: () {
                        HapticFeedback.lightImpact();
                        themeSelected(Themes.dawn);
                        navigateToApp();
                      },
                      child: const Text(
                        'Dawn',
                        style: TextStyle(
                            color: Colors.white, fontSize: 18, height: 1.5),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xff881A72),
                      side: const BorderSide(color: Colors.white, width: 3),
                    ),
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      themeSelected(Themes.wintermark);
                      navigateToApp();
                    },
                    child: const Text('Wintermark',
                        style: TextStyle(
                            color: Colors.white, fontSize: 18, height: 1.5)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(right: 8),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xff881A72),
                        side: const BorderSide(color: Colors.white, width: 3),
                      ),
                      onPressed: () {
                        HapticFeedback.lightImpact();
                        themeSelected(Themes.navarr);
                        navigateToApp();
                      },
                      child: const Text(
                        'Navarr',
                        style: TextStyle(
                            color: Colors.white, fontSize: 18, height: 1.5),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xff881A72),
                      side: const BorderSide(color: Colors.white, width: 3),
                    ),
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      themeSelected(Themes.league);
                      navigateToApp();
                    },
                    child: const Text('League',
                        style: TextStyle(
                            color: Colors.white, fontSize: 18, height: 1.5)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(right: 8),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xff881A72),
                        side: const BorderSide(color: Colors.white, width: 3),
                      ),
                      onPressed: () {
                        HapticFeedback.lightImpact();
                        themeSelected(Themes.imperialOrcs);
                        navigateToApp();
                      },
                      child: const Text(
                        'Imperial Orcs',
                        style: TextStyle(
                            color: Colors.white, fontSize: 18, height: 1.5),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xff881A72),
                      side: const BorderSide(color: Colors.white, width: 3),
                    ),
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      themeSelected(Themes.brassCoast);
                      navigateToApp();
                    },
                    child: const Text('Brass Coast',
                        style: TextStyle(
                            color: Colors.white, fontSize: 18, height: 1.5)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(right: 8),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xff881A72),
                        side: const BorderSide(color: Colors.white, width: 3),
                      ),
                      onPressed: () {
                        HapticFeedback.lightImpact();
                        themeSelected(Themes.varushka);
                        navigateToApp();
                      },
                      child: const Text(
                        'Varushka',
                        style: TextStyle(
                            color: Colors.white, fontSize: 18, height: 1.5),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xff881A72),
                      side: const BorderSide(color: Colors.white, width: 3),
                    ),
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      themeSelected(Themes.marches);
                      navigateToApp();
                    },
                    child: const Text('Marches',
                        style: TextStyle(
                            color: Colors.white, fontSize: 18, height: 1.5)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(right: 8),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xff881A72),
                        side: const BorderSide(color: Colors.white, width: 3),
                      ),
                      onPressed: () {
                        HapticFeedback.lightImpact();
                        themeSelected(Themes.urizen);
                        navigateToApp();
                      },
                      child: const Text(
                        'Urizen',
                        style: TextStyle(
                            color: Colors.white, fontSize: 18, height: 1.5),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xff881A72),
                      side: const BorderSide(color: Colors.white, width: 3),
                    ),
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      themeSelected(Themes.highGuard);
                      navigateToApp();
                    },
                    child: const Text('High Guard',
                        style: TextStyle(
                            color: Colors.white, fontSize: 18, height: 1.5)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> themeSelected(Themes theme) async {
    viewModel.setTheme(theme);
    MainViewModel mainViewModel = MainViewModel();
    await mainViewModel.getHasSeenIntro();
    await mainViewModel.setTheme();
  }

  void navigateToApp() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const MyApp()));
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      backgroundColorAllTabs: const Color(0xff881A72),
      isShowSkipBtn: false,
      renderPrevBtn:
          const Text("Previous", style: TextStyle(color: Colors.white)),
      renderNextBtn:
          const Text("Next", style: TextStyle(color: Color(0xff881A72))),
      nextButtonStyle: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.white)),
      renderDoneBtn:
          const Text("Done", style: TextStyle(color: Color(0xff881A72))),
      doneButtonStyle: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.white)),
      indicatorConfig: IndicatorConfig(
          sizeIndicator: 8.0,
          typeIndicatorAnimation: TypeIndicatorAnimation.sliding,
          colorActiveIndicator: Colors.white,
          colorIndicator: Colors.grey[400]),
      listCustomTabs: renderListCustomTabs(),
      scrollPhysics: const BouncingScrollPhysics(),
      onDonePress: () {
        HapticFeedback.lightImpact();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const MainPage()));
      },
      onNextPress: () {
        HapticFeedback.lightImpact();
      },
      onSkipPress: () {
        HapticFeedback.lightImpact();
      },
    );
  }
}

enum Themes {
  wintermark,
  dawn,
  navarr,
  brassCoast,
  league,
  imperialOrcs,
  varushka,
  highGuard,
  urizen,
  marches,
  defaultTheme
}
