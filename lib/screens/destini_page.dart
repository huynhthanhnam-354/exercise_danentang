import 'package:flutter/material.dart';

class DestiniPage extends StatefulWidget {
  const DestiniPage({Key? key}) : super(key: key);

  @override
  State<DestiniPage> createState() => _DestiniPageState();
}

class _DestiniPageState extends State<DestiniPage> {
  int storyNumber = 0;
  
  final List<Map<String, dynamic>> stories = [
    {
      'story': 'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide-brimmed hat and soulless eyes opens the passenger door for you and asks: "Need a ride, boy?"',
      'choice1': 'I\'ll hop in. Thanks for the help!',
      'choice2': 'Better ask him if he\'s a murderer first.',
      'image': 'lib/assets/images/story1.png',
    },
    {
      'story': 'He nods slowly, unphased by the question.',
      'choice1': 'At least he\'s honest. I\'ll climb in.',
      'choice2': 'Wait, I know how to change a tire.',
      'image': 'lib/assets/images/story2.png',
    },
    {
      'story': 'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
      'choice1': 'I love Elton John! Hand him the cassette tape.',
      'choice2': 'It\'s him or me! You take the knife and stab him.',
      'image': 'lib/assets/images/story3.png',
    },
    {
      'story': 'You bond with the murderer while crooning verses of "Can You Feel the Love Tonight". He drops you off at the next town. Before you go, he asks you if you know any good places to dump bodies. You reply:',
      'choice1': '"Try the pier."',
      'choice2': '"No, I hear the police are looking there."',
      'image': 'lib/assets/images/story4.png',
    },
  ];

  void nextStory(int choiceNumber) {
    setState(() {
      if (storyNumber == 0 && choiceNumber == 1) {
        storyNumber = 2;
      } else if (storyNumber == 0 && choiceNumber == 2) {
        storyNumber = 1;
      } else if (storyNumber == 1 && choiceNumber == 1) {
        storyNumber = 2;
      } else if (storyNumber == 1 && choiceNumber == 2) {
        storyNumber = 0;
      } else if (storyNumber == 2 && choiceNumber == 1) {
        storyNumber = 3;  // Đi đến story 4
      } else if (storyNumber == 2 && choiceNumber == 2) {
        storyNumber = 0;
      } else if (storyNumber == 3 && choiceNumber == 1) {
        storyNumber = 0;  // Kết thúc và quay về đầu
      } else if (storyNumber == 3 && choiceNumber == 2) {
        storyNumber = 0;  // Kết thúc và quay về đầu
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black45,
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 3,
                child: stories[storyNumber]['image'] != null
                    ? Image.asset(
                        stories[storyNumber]['image'],
                        fit: BoxFit.contain,
                      )
                    : const SizedBox(),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      stories[storyNumber]['story']!,
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    nextStory(1);
                  },
                  style: TextButton.styleFrom(backgroundColor: Colors.red),
                  child: Text(
                    stories[storyNumber]['choice1']!,
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    nextStory(2);
                  },
                  style: TextButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text(
                    stories[storyNumber]['choice2']!,
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}