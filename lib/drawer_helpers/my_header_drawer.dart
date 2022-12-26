import 'package:empire_lrp_helper/Themes/themes.dart';
import 'package:flutter/material.dart';

class myHeaderDrawer extends StatefulWidget {
  const myHeaderDrawer({Key? key}) : super(key: key);

  @override
  State<myHeaderDrawer> createState() => _myHeaderDrawerState();
}

class _myHeaderDrawerState extends State<myHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: EmpireThemes.dawnTheme.shade700,
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            height: 120,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('assets/dawnLogo.png'))),
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
