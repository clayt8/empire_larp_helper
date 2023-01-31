import 'package:empire_lrp_helper/Screens/Runes/viewmodel/rune_study_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shakemywidget/flutter_shakemywidget.dart';
import '../../../main_viewmodel.dart';
import '../model/runes_model.dart';
import '../model/runes_study_model.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';


Route runeStudyRoute(List<RuneCardModel> runes) {
  RuneStudyViewModel viewModel = RuneStudyViewModel();
  viewModel.runes = runes.toList();
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const RuneStudyScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}

class RuneStudyScreen extends StatefulWidget {
  const RuneStudyScreen({Key? key}) : super(key: key);

  @override
  State<RuneStudyScreen> createState() => _RuneStudyScreenState();
}

class _RuneStudyScreenState extends State<RuneStudyScreen>
    with SingleTickerProviderStateMixin {
  late List<RuneCardModel> runes;
  late RuneStudyViewModel viewModel;
  late RuneStudyModel currentSet;

  String title = "Rune Study Time!";

  bool allowClick = true;

  final shakeKey0 = GlobalKey<ShakeWidgetState>();
  final shakeKey1 = GlobalKey<ShakeWidgetState>();
  final shakeKey2 = GlobalKey<ShakeWidgetState>();
  final shakeKey3 = GlobalKey<ShakeWidgetState>();
  final shakeKey4 = GlobalKey<ShakeWidgetState>();

  bool correctChoice = false;

  Color color0 = Colors.white;
  Color color1 = Colors.white;
  Color color2 = Colors.white;
  Color color3 = Colors.white;
  Color color4 = Colors.white;

  String correctSound = "assets/sounds/correct.wav";
  String incorrectSound = "assets/sounds/incorrect.mp3";

  @override
  void initState() {
    super.initState();
    viewModel = RuneStudyViewModel();
    runes = viewModel.runes.toList();
    currentSet = viewModel.getNewSet();
  }

  void cardSelected(RuneCardModel choice, int index) {
    setState(() {
      if (choice == currentSet.currentActive) {
        correctChoice = true;
      } else {
        correctChoice = false;
      }
    });

    Future.delayed(const Duration(milliseconds: 100), () {
      if (correctChoice) {
        final player = AudioCache();
        player.play('sounds/correct.wav');

        HapticFeedback.lightImpact();
        setState(() {
          allowClick = false;
          color0 = Colors.green[50]!;
          switch (index) {
            case 1:
              color1 = Colors.green[50]!;
              break;
            case 2:
              color2 = Colors.green[50]!;
              break;
            case 3:
              color3 = Colors.green[50]!;
              break;
            case 4:
              color4 = Colors.green[50]!;
              break;
          }
        });
      } else {
        final player = AudioCache();
        player.play('sounds/incorrect.mp3');

        setState(() {
          allowClick = false;
          color0 = Colors.red[200]!;
          shakeKey0.currentState?.shake();
          HapticFeedback.heavyImpact();
          switch (index) {
            case 1:
              {
                color1 = Colors.red[200]!;
                shakeKey1.currentState?.shake();
              }
              break;
            case 2:
              {
                color2 = Colors.red[200]!;
                shakeKey2.currentState?.shake();
              }
              break;
            case 3:
              {
                color3 = Colors.red[200]!;
                shakeKey3.currentState?.shake();
              }
              break;
            case 4:
              {
                color4 = Colors.red[200]!;
                shakeKey4.currentState?.shake();
              }
              break;
          }

          switch (findCorrectCard()) {
            case 1:
              {
                color1 = Colors.green[50]!;
              }
              break;
            case 2:
              {
                color2 = Colors.green[50]!;
              }
              break;
            case 3:
              {
                color3 = Colors.green[50]!;
              }
              break;
            case 4:
              {
                color4 = Colors.green[50]!;
              }
              break;
          }
        });
      }
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        currentSet = viewModel.getNewSet();
        resetAll();
      });
    });
  }

  int findCorrectCard() {
    for (int i = 0; i < currentSet.choiceList.length; i++) {
      if (currentSet.currentActive == currentSet.choiceList[i]) {
        return i + 1;
      }
    }
    return 0;
  }

  void resetAll() {
    setState(() {
      color0 = Colors.white;
      color1 = Colors.white;
      color2 = Colors.white;
      color3 = Colors.white;
      color4 = Colors.white;
      allowClick = true;
    });
  }

  @override
  Widget build(BuildContext context) {

    MainViewModel mainViewModel = MainViewModel();
    MaterialColor theme = mainViewModel.colourTheme;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // Height (without SafeArea)
    var padding = MediaQuery.of(context).viewPadding;

    // Height (without status and toolbar)
    double height3 = height - padding.top - kToolbarHeight;

    return MaterialApp(
        theme: ThemeData(
          primarySwatch: theme,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text(title),
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ShakeMe(
                    shakeDuration: const Duration(milliseconds: 500),
                    shakeCount: 3,
                    shakeOffset: 10,
                    key: shakeKey0,
                    child: SizedBox(
                      height: ((width / 100) * 75),
                      width: ((width / 100) * 75),
                      child: Card(
                        color: color0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        elevation: 20,
                        child: Center(
                            child: currentSet.isRuneImage
                                ? Image.asset(
                                    currentSet.currentActive.imagePath,
                                    height: 120,
                                    fit: BoxFit.cover)
                                : Text(currentSet.currentActive.name,
                                    style: const TextStyle(fontSize: 56),
                                    maxLines: 2,
                                    textAlign: TextAlign.center)),
                      ),
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(left: 20.0, right: 20.0, top: ((height3 / 100) * 4)),
                child: studyButtons(currentSet, ((width / 100) * 40)),
              ),
            ],
          ),
        ));
  }

  Widget studyButtons(RuneStudyModel currentSet, double size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.all(5),
                  child: ShakeMe(
                    key: shakeKey1,
                    shakeOffset: 10,
                    shakeCount: 3,
                    shakeDuration: const Duration(milliseconds: 500),
                    child: SizedBox(
                      height: size,
                      width: size,
                      child: Card(
                        color: color1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        elevation: 20,
                        child: InkWell(
                          onTap: () {
                            if (allowClick) {
                              cardSelected(currentSet.choiceList[0], 1);
                            }
                          },
                          child: Center(
                              child: !currentSet.isRuneImage
                                  ? Image.asset(
                                      currentSet.choiceList[0].imagePath,
                                      height: 80,
                                      fit: BoxFit.cover)
                                  : Text(currentSet.choiceList[0].name,
                                      style: const TextStyle(fontSize: 28),
                                      maxLines: 2,
                                      textAlign: TextAlign.center)),
                        ),
                      ),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.all(5),
                  child: ShakeMe(
                    key: shakeKey2,
                    shakeOffset: 10,
                    shakeCount: 3,
                    shakeDuration: const Duration(milliseconds: 500),
                    child: SizedBox(
                      height: size,
                      width: size,
                      child: Card(
                        color: color2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        elevation: 20,
                        child: InkWell(
                          onTap: () {
                            if (allowClick) {
                              cardSelected(currentSet.choiceList[1], 2);
                            }
                          },
                          child: Center(
                              child: !currentSet.isRuneImage
                                  ? Image.asset(
                                      currentSet.choiceList[1].imagePath,
                                      height: 80,
                                      fit: BoxFit.cover)
                                  : Text(currentSet.choiceList[1].name,
                                      style: const TextStyle(fontSize: 28),
                                      maxLines: 2,
                                      textAlign: TextAlign.center)),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.all(5),
                  child: ShakeMe(
                    key: shakeKey3,
                    shakeOffset: 10,
                    shakeCount: 3,
                    shakeDuration: const Duration(milliseconds: 500),
                    child: SizedBox(
                      height: size,
                      width: size,
                      child: Card(
                        color: color3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        elevation: 20,
                        child: InkWell(
                          onTap: () {
                            if (allowClick) {
                              cardSelected(currentSet.choiceList[2], 3);
                            }
                          },
                          child: Center(
                              child: !currentSet.isRuneImage
                                  ? Image.asset(
                                      currentSet.choiceList[2].imagePath,
                                      height: 80,
                                      fit: BoxFit.cover)
                                  : Text(currentSet.choiceList[2].name,
                                      style: const TextStyle(fontSize: 28),
                                      maxLines: 2,
                                      textAlign: TextAlign.center)),
                        ),
                      ),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.all(5),
                  child: ShakeMe(
                    key: shakeKey4,
                    shakeOffset: 10,
                    shakeCount: 3,
                    shakeDuration: const Duration(milliseconds: 500),
                    child: SizedBox(
                      height: size,
                      width: size,
                      child: Card(
                        color: color4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        elevation: 20,
                        child: InkWell(
                          onTap: () {
                            if (allowClick) {
                              cardSelected(currentSet.choiceList[3], 4);
                            }
                          },
                          child: Center(
                              child: !currentSet.isRuneImage
                                  ? Image.asset(
                                      currentSet.choiceList[3].imagePath,
                                      height: 80,
                                      fit: BoxFit.cover)
                                  : Text(currentSet.choiceList[3].name,
                                      style: const TextStyle(fontSize: 28),
                                      maxLines: 2,
                                      textAlign: TextAlign.center)),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
