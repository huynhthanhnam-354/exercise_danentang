import 'package:flutter/material.dart';
import 'dart:math';

class MagicBallPage extends StatefulWidget {
  const MagicBallPage({Key? key}) : super(key: key);

  @override
  State<MagicBallPage> createState() => _MagicBallPageState();
}

class _MagicBallPageState extends State<MagicBallPage> {
  int ballNumber = 1;

  void changeBallFace() {
    setState(() {
      ballNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text('Ask Me Anything'),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            changeBallFace();
          },
          child: Image.asset('lib/assets/images/ball$ballNumber.png'),
        ),
      ),
    );
  }
}