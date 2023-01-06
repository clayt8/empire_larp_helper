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
  String title = "Rune";

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
            title: Text(title),
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: FutureBuilder<RuneModel>(
            future: rune,
            builder: (BuildContext context,
                AsyncSnapshot<RuneModel> snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40),
                        child: Text(snapshot.data!.name, style: const TextStyle(fontSize: 54)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20.0, top: 20.0),
                        height: 120,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: AssetImage(snapshot.data!.imagePath))),
                      ),
                      const Text("Description", style: TextStyle(fontSize: 22)),
                      Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10, bottom: 10),
                        child: Text(snapshot.data!.description, style: const TextStyle(fontSize: 16)),
                      ),
                      const Text("Uses in Magic", style: TextStyle(fontSize: 22)),
                      Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10, bottom: 10),
                        child: Text(snapshot.data!.useInMagic, style: const TextStyle(fontSize: 16))
                      ),
                      const Text("Uses in Crafting", style: TextStyle(fontSize: 22)),
                      Container(
                          margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10, bottom: 80),
                          child: Text(snapshot.data!.useInCrafting, style: const TextStyle(fontSize: 16))
                      ),
                    ],
                  ),
                );
              } else {
                return const Text(
                    "Loading Runes"); //TODO cool loading rune animation thing
              }
            },
          ),
        ));
  }


  void setTitle(String runeName){
    setState(() {
      title = runeName;
    });
  }

}
