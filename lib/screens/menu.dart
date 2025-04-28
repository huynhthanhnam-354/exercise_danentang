import 'package:flutter/material.dart';
import 'iam_rich_page.dart';
import 'xylo_phone_page.dart';
import 'dice_page.dart';
import 'magic_ball_page.dart';
import 'bmi_page.dart';
import 'clima_page.dart';
import 'bitcoin_page.dart';
import 'flash_chat_page.dart';
import 'todoey_page.dart';
import 'destini_page.dart';
import 'quizzler_page.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: const Text(
          'Ứng dụng của tôi',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton(context, 'I Am Rich', const IAmRichPage()),
              buildButton(context, 'Xylophone', const XylophoneApp()),
              buildButton(context, 'Dice', const DicePage()),
              buildButton(context, 'Magic 8 Ball', const MagicBallPage()),
              buildButton(context, 'BMI Calculator', const BMIPage()),
              buildButton(context, 'Clima', const ClimaPage()),
              buildButton(context, 'Bitcoin Ticker', const BitcoinPage()),
              buildButton(context, 'Flash Chat', const FlashChatPage()),
              buildButton(context, 'Todoey', const TodoeyPage()),
              buildButton(context, 'Destini', const DestiniPage()),
              buildButton(context, 'Quizzler', const QuizzlerPage()),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context, String title, Widget page) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.redAccent[800],
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          textStyle: const TextStyle(fontSize: 20),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Text(title),
      ),
    );
  }
}