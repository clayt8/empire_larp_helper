import 'package:empire_lrp_helper/Screens/Runes/viewmodel/rune_study_viewmodel.dart';
import 'package:flutter/material.dart';
import '../../../main_viewmodel.dart';
import '../model/runes_model.dart';
import '../model/runes_study_model.dart';
import '../viewmodel/runes_viewmodel.dart';

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

class _RuneStudyScreenState extends State<RuneStudyScreen> {
  late List<RuneCardModel> runes;
  late RuneStudyViewModel viewModel;
  late RuneStudyModel currentSet;

  String title = "Rune Study Time!";

  @override
  void initState() {
    super.initState();
    viewModel = RuneStudyViewModel();
    runes = viewModel.runes.toList();
    currentSet = viewModel.getNewSet();
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
              SizedBox(
                  height: 300,
                  width: 300,
                  child: Center(
                    child: Expanded(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        elevation: 20,
                        child: Padding(
                            padding: EdgeInsets.all(70),
                            child: currentSet.isRuneImage
                                ? Image.asset(
                                    currentSet.currentActive.imagePath,
                                    height: 120,
                                    fit: BoxFit.cover)
                                : Text(currentSet.currentActive.name)),
                      ),
                    ),
                  )),
              Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40),
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
              Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation: 20,
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.all(70),
                      child: Text(currentSet.choiceList[0].name),
                    ),
                  ),
                ),
              ),
              Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation: 20,
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.all(70),
                      child: Text(currentSet.choiceList[1].name),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation: 20,
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.all(70),
                      child: Text(currentSet.choiceList[2].name),
                    ),
                  ),
                ),
              ),
              Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation: 20,
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.all(70),
                      child: Text(currentSet.choiceList[3].name),
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
