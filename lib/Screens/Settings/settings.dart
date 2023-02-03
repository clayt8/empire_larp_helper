import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../intro_slider/intro_slider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            title: const Text( "Change Theme"),
            subtitle: const Text("Clicking here will take you to the intro screen"),
            trailing: Image.asset("assets/runes/Feresh.png", height: 36, fit: BoxFit.contain),
            onTap: () {
              HapticFeedback.lightImpact();
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => const IntroSliderScreen()));
            },
          ),
        )
      ],
    );
  }
}
