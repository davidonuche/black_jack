import 'package:flutter/material.dart';

class BlackJackScreen extends StatefulWidget {
  const BlackJackScreen({super.key});

  @override
  State<BlackJackScreen> createState() => _BlackJackScreenState();
}

class _BlackJackScreenState extends State<BlackJackScreen> {
  bool _isGameStarted =  false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isGameStarted
      ? Container()
      : Center(
        child: MaterialButton(
          color: Colors.brown[200],
          minWidth: 150,
          onPressed: () {
            setState(() {
              _isGameStarted = true;
            });
          },
        child: Text("Start Game")
        )
      )
    );
  }
}