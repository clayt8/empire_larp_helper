import 'package:empire_lrp_helper/Screens/Runes/model/runes_model.dart';
import 'package:empire_lrp_helper/Screens/Runes/viewmodel/rune_detail_viewmodel.dart';
import 'package:flutter/material.dart';

import '../../../main_viewmodel.dart';

Route runeDetailRoute(String runeName) {
  RuneDetailViewModel viewModel = RuneDetailViewModel();
  viewModel.currentRuneName = runeName;
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const RuneDetailScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}

class RuneDetailScreen extends StatefulWidget {
  const RuneDetailScreen({Key? key}) : super(key: key);

  @override
  State<RuneDetailScreen> createState() => _RuneDetailScreenState();
}

class _RuneDetailScreenState extends State<RuneDetailScreen> {
  late RuneDetailViewModel viewModel;
  late Future<RuneModel> rune;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = RuneDetailViewModel();
    rune = viewModel.getRune();
  }


  @override
  Widget build(BuildContext context) {
    MainViewModel viewModel = MainViewModel();
    MaterialColor theme = viewModel.colourTheme;

    return MaterialApp(
        theme: ThemeData(
          primarySwatch: theme,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Rune (to be gotten from repo)"),
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: const Center(
            child: Text("Rune page"),
          ),
        ));
  }
}
