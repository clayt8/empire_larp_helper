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
    return Container(
      color: (isPressed == true) ? Colors.grey : Colors.blue,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              isPressed = !isPressed;
            });
          },
          child: Text("i change things"),
        ),
      ),
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
