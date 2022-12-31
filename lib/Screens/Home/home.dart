import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Home"),
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: if(isPressed),
//       child: const Center(
//         child: Text(
//             "Home"
//         ),
//       );,
//     )
//   }
// }
