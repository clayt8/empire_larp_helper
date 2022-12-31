import 'package:empire_lrp_helper/Themes/themes.dart';
import 'package:empire_lrp_helper/main_viewmodel.dart';
import 'package:flutter/material.dart';

class myHeaderDrawer extends StatefulWidget {
  const myHeaderDrawer({Key? key}) : super(key: key);

  @override
  State<myHeaderDrawer> createState() => _myHeaderDrawerState();
}

class _myHeaderDrawerState extends State<myHeaderDrawer> {
  MainViewModel viewModel = MainViewModel();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: viewModel.colourTheme![700],
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            height: 120,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage(viewModel.imagePath))),
          ),
          const Text(
            "Empire Unofficial Handbook",
            style: TextStyle(color: Colors.black, fontSize: 20),
          )
        ],
      ),
    );
  }
}
