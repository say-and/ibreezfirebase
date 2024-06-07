import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Column(
        children: [
          Center(
            child: Text(textAlign: TextAlign.center,
              "WELCOME",
              style: TextStyle(color: Colors.black, fontSize: 40),
            ),
          )
        ],
      ),
    );
  }
}
