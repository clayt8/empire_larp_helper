import 'package:empire_lrp_helper/Screens/Runes/viewmodel/rune_study_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import '../../../main_viewmodel.dart';
import '../model/runes_model.dart';
import '../model/runes_study_model.dart';
import 'dart:async';

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

  bool shakeCard0 = false;
  bool shakeCard1 = false;
  bool shakeCard2 = false;
  bool shakeCard3 = false;
  bool shakeCard4 = false;

  ShakeConstant shakeCon0 = ShakeVerticalConstant2();
  ShakeConstant shakeCon1 = ShakeVerticalConstant2();
  ShakeConstant shakeCon2 = ShakeVerticalConstant2();
  ShakeConstant shakeCon3 = ShakeVerticalConstant2();
  ShakeConstant shakeCon4 = ShakeVerticalConstant2();

  Color color0 = Colors.white;
  Color color1 = Colors.white;
  Color color2 = Colors.white;
  Color color3 = Colors.white;
  Color color4 = Colors.white;

  @override
  void initState() {
    super.initState();
    viewModel = RuneStudyViewModel();
    runes = viewModel.runes.toList();
    currentSet = viewModel.getNewSet();
  }

  void cardSelected(RuneCardModel choice, int index) {
    allowClick = false;
    if (choice == currentSet.currentActive) {
      setState(() {
        color0 = Colors.green[50]!;
        shakeCon0 = ShakeVerticalConstant2();
        shakeCard0 = true;
        switch (index) {
          case 1:
            {
              color1 = Colors.green[50]!;
              shakeCon1 = ShakeVerticalConstant2();
            }
            break;
          case 2:
            {
              color2 = Colors.green[50]!;
              shakeCon2 = ShakeVerticalConstant2();
            }
            break;
          case 3:
            {
              color3 = Colors.green[50]!;
              shakeCon3 = ShakeVerticalConstant2();
            }
            break;
          case 4:
            {
              color4 = Colors.green[50]!;
              shakeCon4 = ShakeVerticalConstant2();
            }
            break;
        }
      });
    } else {
      setState(() {
        color0 = Colors.red[200]!;
        shakeCon0 = ShakeHorizontalConstant2();
        shakeCard0 = true;
        switch (index) {
          case 1:
            {
              color1 = Colors.red[200]!;
              shakeCon1 = ShakeHorizontalConstant2();
              shakeCard1 = true;
            }
            break;
          case 2:
            {
              color2 = Colors.red[200]!;
              shakeCon2 = ShakeHorizontalConstant2();
              shakeCard2 = true;
            }
            break;
          case 3:
            {
              color3 = Colors.red[200]!;
              shakeCon3 = ShakeHorizontalConstant2();
              shakeCard3 = true;
            }
            break;
          case 4:
            {
              color4 = Colors.red[200]!;
              shakeCon4 = ShakeHorizontalConstant2();
              shakeCard4 = true;
            }
            break;
        }
      });

      setState(() {
        switch (findCorrectCard()) {
          case 1:
            {
              color1 = Colors.green[50]!;
              shakeCon1 = ShakeVerticalConstant2();
              shakeCard1 = true;
            }
            break;
          case 2:
            {
              color2 = Colors.green[50]!;
              shakeCon2 = ShakeVerticalConstant2();
              shakeCard2 = true;
            }
            break;
          case 3:
            {
              color3 = Colors.green[50]!;
              shakeCon3 = ShakeVerticalConstant2();
              shakeCard3 = true;
            }
            break;
          case 4:
            {
              color4 = Colors.green[50]!;
              shakeCon4 = ShakeVerticalConstant2();
              shakeCard4 = true;
            }
            break;
        }
      });
    }

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        currentSet = viewModel.getNewSet();
        resetAll();
      });
    });

    // setState(() {
    //   color0 = Colors.green[50]!;
    // });
    // currentSet = viewModel.getNewSet();

    // Future.delayed(const Duration(milliseconds: 500), () {
    //   setState(() {
    //     shakeCard0 = false;
    //     cardSelected(currentSet.choiceList[0], 1);
    //   });
    // });
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

      shakeCard0 = false;
      shakeCard1 = false;
      shakeCard2 = false;
      shakeCard3 = false;
      shakeCard4 = false;
      allowClick = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    MainViewModel mainViewModel = MainViewModel();
    MaterialColor theme = mainViewModel.colourTheme;

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
                  child: ShakeWidget(
                    shakeConstant: shakeCon0,
                    autoPlay: shakeCard0,
                    enableWebMouseHover: true,
                    child: SizedBox(
                      height: 300,
                      width: 300,
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
                margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 60),
                child: studyButtons(currentSet),
              ),
            ],
          ),
        ));
  }

  Widget studyButtons(RuneStudyModel currentSet) {
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
                child: SizedBox(
                  height: 160,
                  width: 160,
                  child: Card(
                    color: color1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    elevation: 20,
                    child: InkWell(
                      onTap: () {
                        if(allowClick) {
                          cardSelected(currentSet.choiceList[0], 1);
                        }
                      },
                      child: Center(
                          child: !currentSet.isRuneImage
                              ? Image.asset(currentSet.choiceList[0].imagePath,
                                  height: 80, fit: BoxFit.cover)
                              : Text(currentSet.choiceList[0].name,
                                  style: const TextStyle(fontSize: 28),
                                  maxLines: 2,
                                  textAlign: TextAlign.center)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  height: 160,
                  width: 160,
                  child: Card(
                    color: color2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    elevation: 20,
                    child: InkWell(
                      onTap: () {
                        if(allowClick) {
                          cardSelected(currentSet.choiceList[1], 2);
                        }
                      },
                      child: Center(
                          child: !currentSet.isRuneImage
                              ? Image.asset(currentSet.choiceList[1].imagePath,
                                  height: 80, fit: BoxFit.cover)
                              : Text(currentSet.choiceList[1].name,
                                  style: const TextStyle(fontSize: 28),
                                  maxLines: 2,
                                  textAlign: TextAlign.center)),
                    ),
                  ),
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
              Padding(
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  height: 160,
                  width: 160,
                  child: Card(
                    color: color3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    elevation: 20,
                    child: InkWell(
                      onTap: () {
                        if(allowClick) {
                          cardSelected(currentSet.choiceList[2], 3);
                        }
                      },
                      child: Center(
                          child: !currentSet.isRuneImage
                              ? Image.asset(currentSet.choiceList[2].imagePath,
                                  height: 80, fit: BoxFit.cover)
                              : Text(currentSet.choiceList[2].name,
                                  style: const TextStyle(fontSize: 28),
                                  maxLines: 2,
                                  textAlign: TextAlign.center)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  height: 160,
                  width: 160,
                  child: Card(
                    color: color4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    elevation: 20,
                    child: InkWell(
                      onTap: () {
                        if(allowClick) {
                          cardSelected(currentSet.choiceList[3], 4);
                        }
                      },
                      child: Center(
                          child: !currentSet.isRuneImage
                              ? Image.asset(currentSet.choiceList[3].imagePath,
                                  height: 80, fit: BoxFit.cover)
                              : Text(currentSet.choiceList[3].name,
                                  style: const TextStyle(fontSize: 28),
                                  maxLines: 2,
                                  textAlign: TextAlign.center)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
